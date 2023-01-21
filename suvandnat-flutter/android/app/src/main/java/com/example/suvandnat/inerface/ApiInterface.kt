package com.example.suvandnat.inerface

import com.adyen.checkout.googlepay.model.PaymentDataRequestModel
import com.example.suvandnat.model.JsonPayRequestData
import com.example.suvandnat.model.PaymentMethodRequest
import com.example.suvandnat.model.PaymentResultData
import com.example.suvandnat.paymentmethod.PaymentMethodData
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST


interface ApiInterface {
    @Headers("x-API-key: AQEshmfxLYvPaxBHw0m/n3Q5qf3VZYJCIJxOWUNMw0BR8QvSqBPe+y8KsGVLyy4QwV1bDb7kfNy1WIxIIkxgBw==-8Riqu+2BZIi152bjjlvXzR5wjrrbXnLFzNO2DMLJf/8=-59;U3q~fuENXT.2F")
    @POST("paymentMethods")
    fun getApiData(@Body paymentMethodRequest: PaymentMethodRequest): Call<PaymentMethodData>

    @Headers("x-API-key: AQEshmfxLYvPaxBHw0m/n3Q5qf3VZYJCIJxOWUNMw0BR8QvSqBPe+y8KsGVLyy4QwV1bDb7kfNy1WIxIIkxgBw==-8Riqu+2BZIi152bjjlvXzR5wjrrbXnLFzNO2DMLJf/8=-59;U3q~fuENXT.2F")
    @POST("payments")
    fun getPayRequestApiData(@Body paymentRequest: JsonPayRequestData): Call<PaymentResultData>
}