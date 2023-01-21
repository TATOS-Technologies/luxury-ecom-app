//
//  ViewController.swift
//
//  Created by OCS-MAC-43 on 20/12/22.
//

import UIKit
import Adyen

class AdyenManager {
    
    private var session: Adyen.AdyenSession?
    private var adyenContext: AdyenContext?
    private var cardComponent: CardComponent?
    
    private var createPaymentSessionResponseRepresentation: CreatePaymentSessionResponseRepresentation?

    private let paymentData: Dictionary<String,Any>
    
    init(paymentData: Dictionary<String,Any>) {
        self.paymentData = paymentData
        self.adyenContext = self.makeAdyenContext()

        createPaymentSessionAPI { result in
            DispatchQueue.main.async {
                self.createPaymentSessionResponseRepresentation = result
                self.initializeAdyenSession()
            }
        }
    }

    private func makeAdyenContext() -> AdyenContext? {
        guard let apiContext = AppDelegate.shared().apiContext else {
            return nil
        }
        
        // Create the amount with the value in minor units and the currency code.
        let amount = Amount(value: Decimal(Double((paymentData["amount"] as? String ?? "") ) ?? 0.0), currencyCode: (paymentData["currency"] as? String ?? "EUR") )
        // Create the payment object with the amount and country code.
        let payment = Payment(amount: amount, countryCode: (paymentData["countryCode"] as? String ?? "NL") )
        // Create an instance of AdyenContext, passing the instance of APIContext, payment object, and optional analytics configuration.
        let adyenContext = AdyenContext(apiContext: apiContext, payment:payment)
        
        return adyenContext
    }
    
    private func initializeAdyenSession() {
        guard let sessionId = self.createPaymentSessionResponseRepresentation?.id else {
            return
        }
        guard let sessionData = self.createPaymentSessionResponseRepresentation?.sessionData else {
            return
        }
        guard let context = self.adyenContext else {
            return
        }
        let configuration = AdyenSession.Configuration(sessionIdentifier: sessionId, // The id from the API response.
                                                       initialSessionData: sessionData, // The sessionData from the API response.
                                                       context: context)
        
        AdyenSession.initialize(with: configuration, delegate: self, presentationDelegate: self) { [weak self] result in
                switch result {
                case let .success(session):
                    //Store the session object.
                        DispatchQueue.main.async {
                            self?.session = session
                            self?.configureAndInitializeThenShowComponent()
                        }
                        
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    private func configureAndInitializeThenShowComponent() {
        
        // Configure the Component
        var cardComponentConfiguration = CardComponent.Configuration()
        cardComponentConfiguration.showsHolderNameField = true
        
        // Initialize the Component
        // Check that the payment method is supported before showing the Component.
        guard let paymentMethods = self.session?.sessionContext.paymentMethods,
        let paymentMethod = paymentMethods.paymentMethod(ofType: CardPaymentMethod.self) else { return }
        guard let context = self.adyenContext else {
            return
        }
        let cardComponent = CardComponent(paymentMethod: paymentMethod,
                                          context: context,
                                          configuration: cardComponentConfiguration)
         
        // Set the session as the delegate.
        cardComponent.delegate = self.session
        
        self.cardComponent = cardComponent
        
        // Show the Component in your app
        if let window = AppDelegate.shared().window, let rootViewController = window.rootViewController {
            var currentController = rootViewController
            while let presentedController = currentController.presentedViewController {
                currentController = presentedController
            }
            currentController.present(cardComponent.viewController, animated: true, completion: nil)
        }
    }
}

extension AdyenManager: AdyenSessionDelegate {

    func didComplete(with resultCode: Adyen.SessionPaymentResultCode, component: Adyen.Component, session: Adyen.AdyenSession) {
        
        print("didComplete")
        self.cardComponent?.viewController.dismiss(animated: true)
        self.cardComponent = nil
        AppDelegate.shared().flutterResult!(resultCode.rawValue)
    }
    
    
    func didFail(with error: Error, from component: Adyen.Component, session: Adyen.AdyenSession) {
        print("Errror")
        self.cardComponent?.viewController.dismiss(animated: true)
        AppDelegate.shared().flutterResult!(error.localizedDescription)
        print(error)
    }
}




extension AdyenManager : PresentationDelegate {
    func present(component: Adyen.PresentableComponent) {
        
    }
}

extension AdyenManager {
    private func createPaymentSessionAPI(completionHandler: @escaping (CreatePaymentSessionResponseRepresentation?) -> Void) {
        
        
        let amount = Amount(value: Decimal(Double((paymentData["amount"] as? String ?? "") ) ?? 0.0), currencyCode: (paymentData["currency"] as? String ?? "EUR"))
        // Create the payment object with the amount and country code.
        let payment = Payment(amount: amount, countryCode: (paymentData["countryCode"] as? String ?? "IN"))
        
        // prepare json data
        let json: [String: Any] = ["merchantAccount": AppDelegate.merchantAccount,
                                   "amount": ["value": amount.value,
                                              "currency":amount.currencyCode],
                                   "returnUrl": "",
                                   "reference": paymentData["reference"] as? String ?? "iOS Checkout Shopper",
                                   "countryCode": payment.countryCode,
                                   "lineItems": paymentData["lineItems"] as! [[String: Any]]]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        guard let url = URL(string: "https://checkout-test.adyen.com/v69/sessions") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // insert json data to the request
        request.httpBody = jsonData
        request.setValue(AppDelegate.demoServerAPIKey, forHTTPHeaderField: "x-API-key")
        // insert json data to the request
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
                
            guard let httpResponse = response as? HTTPURLResponse,
                        (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }

            if let data = data,
               let representation = try? JSONDecoder().decode(CreatePaymentSessionResponseRepresentation.self, from: data) {
                completionHandler(representation)
            }
        })

        task.resume()
    }
}

extension AdyenManager {
    struct CreatePaymentSessionResponseRepresentation: Codable {
        let id: String
        let sessionData: String
        
        enum CodingKeys: CodingKey {
            case id
            case sessionData
        }
    }
}
