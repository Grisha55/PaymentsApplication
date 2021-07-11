//
//  ObjectDataSourceTests.swift
//  PaymentsAppTests
//
//  Created by Григорий Виняр on 11.07.2021.
//

import XCTest
@testable import PaymentsApp

class ObjectDataSourceTests: XCTestCase {

    var objectDataSource: ObjectDataSource!
    var paymentsVC: PaymentsVC!
    
    let payments = [
        PaymentModel(amount: 1, created: 1, currency: "First", desc: "First"),
        PaymentModel(amount: 2, created: 2, currency: "Second", desc: "Second"),
        PaymentModel(amount: 3, created: 3, currency: "Third", desc: "Third")
    ]
    
    override func setUpWithError() throws {
        objectDataSource = ObjectDataSource()
        paymentsVC = PaymentsVC(token: "")
    }

    override func tearDownWithError() throws {
        objectDataSource = nil
        paymentsVC = nil
    }

    func testPaymentsIsNotNilAndItHaveValues() {
        
        XCTAssertNotNil(objectDataSource.payments)
    }
    
    func testTableViewNumberOfRows() {
        
        // get
        var rows = 0
        
        // when
        objectDataSource.payments = payments
        rows = objectDataSource.tableView(paymentsVC.tableView, numberOfRowsInSection: 0)
        
        // then
        XCTAssertEqual(rows, 3)
    }
    
    func testCellForRowAtForTableView() {
        
        // get
        let tableView = UITableView()
        
        // when
        objectDataSource.payments = payments
        paymentsVC.tableView.register(UITableViewCell.self, forCellReuseIdentifier: PaymentCell.paymentCell)
        
        tableView.register(PaymentCell.self, forCellReuseIdentifier: PaymentCell.paymentCell)
        
        let cell = objectDataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! PaymentCell
        
        let payment = objectDataSource.payments.first
        
        cell.configureCell(created: String((payment?.created)!), currency: (payment?.currency)!, desc: (payment?.desc)!, amount: String((payment?.amount)!))
        
        cell.textLabel?.text = payment?.currency
        
        // then
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.textLabel?.text, "First")
    }
    

}
