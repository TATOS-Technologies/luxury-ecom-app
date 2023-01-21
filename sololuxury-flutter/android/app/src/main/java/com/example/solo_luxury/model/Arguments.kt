package com.example.solo_luxury.model

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName


class Arguments {
    @SerializedName("currency")
    @Expose
    var currency: String? = null

    @SerializedName("amount")
    @Expose
    var amount: Double? = null

    @SerializedName("countryCode")
    @Expose
    var countryCode: String? = null

    @SerializedName("reference")
    @Expose
    var reference: String? = null

    @SerializedName("qty")
    @Expose
    var qty: Int? = null

    @SerializedName("lineItems")
    @Expose
    var lineItems: List<LineItem>? = null
}
