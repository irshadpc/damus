//
//  InvoiceView.swift
//  damus
//
//  Created by William Casarin on 2022-10-18.
//

import SwiftUI

struct InvoiceView: View {
    let invoice: Invoice
    
    var PayButton: some View {
        Button("Pay") {
            guard let url = URL(string: "lightning:" + invoice.string) else {
                return
            }
            UIApplication.shared.open(url)
        }
        .buttonStyle(.bordered)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.secondary.opacity(0.1))
            
            VStack(alignment: .trailing, spacing: 12) {
                HStack {
                    Label("", systemImage: "bolt.fill")
                        .foregroundColor(.orange)
                    Text("Lightning Invoice")
                }
                Divider()
                Text(invoice.description)
                Text("\(invoice.amount / 1000) sats")
                    .font(.title)
                PayButton
                    .zIndex(5.0)
            }
            .padding()
        }
    }
}

let test_invoice = Invoice(description: "this is a description", amount: 10000, string: "lnbc100n1p357sl0sp5t9n56wdztun39lgdqlr30xqwksg3k69q4q2rkr52aplujw0esn0qpp5mrqgljk62z20q4nvgr6lzcyn6fhylzccwdvu4k77apg3zmrkujjqdpzw35xjueqd9ejqcfqv3jhxcmjd9c8g6t0dcxqyjw5qcqpjrzjqt56h4gvp5yx36u2uzqa6qwcsk3e2duunfxppzj9vhypc3wfe2wswz607uqq3xqqqsqqqqqqqqqqqlqqyg9qyysgqagx5h20aeulj3gdwx3kxs8u9f4mcakdkwuakasamm9562ffyr9en8yg20lg0ygnr9zpwp68524kmda0t5xp2wytex35pu8hapyjajxqpsql29r", expiry: 604800, payment_hash: Data(), created_at: 1666139119)

struct InvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceView(invoice: test_invoice)
            .frame(width: 200, height: 200)
    }
}
