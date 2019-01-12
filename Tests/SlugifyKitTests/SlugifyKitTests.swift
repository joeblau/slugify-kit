//
//  SlugifyKitTests.swift
//  SlugifyKit
//
//  Created by Joe Blau on 1/11/19.
//  Copyright © 2019 SlugifyKit. All rights reserved.
//

import Foundation
import XCTest
import SlugifyKit

class SlugifyKitTests: XCTestCase {
    func testRegular() {
        XCTAssertEqual("abc", "abc".slugify)
    }
    
    func testAE() {
        XCTAssertEqual("abcae", "abcæ".slugify)
    }
    
    func testOE() {
        XCTAssertEqual("abco", "abcø".slugify)
    }
    
    func testUnderscore() {
        XCTAssertEqual("a_a", "a_a".slugify)
    }
    
    func testSpecial_carrot() {
        XCTAssertEqual("a-a", "a^a".slugify)
    }
    
    func testSpecial_backtick() {
        XCTAssertEqual("a-a", "a`a".slugify)
    }
    
    func testSpecial_colon() {
        XCTAssertEqual("a-a", "a:a".slugify)
    }
    
    func testSpecial_euro() {
        XCTAssertEqual("a-a", "a€a".slugify)
    }
    
    func testSpace() {
        XCTAssertEqual("a-a", "a a".slugify)
    }
    
    func testSpace_two() {
        XCTAssertEqual("a-a", "a  a".slugify)
    }
    
    func testTile_hyphen() {
        XCTAssertEqual("alaska-airlines-flights-back-in-the-air-after-power-outage-ktva",
                       "Alaska Airlines flights back in the air after power outage - KTVA".slugify)
    }
    func testTile_comma_hyphen_colon() {
        XCTAssertEqual("3-big-things-you-missed-in-the-markets-monday-dollar-tree-apple-roku-yahoo-finance",
                       "3 big things you missed in the markets Monday: Dollar Tree, Apple, Roku - Yahoo Finance".slugify)
    }
    
    static var allTests = [
        ("testRegular", testRegular),
        ("testAE", testAE),
        ("testOE", testOE),
        ("testUnderscore", testUnderscore),
        ("testSpecial_carrot", testSpecial_carrot),
        ("testSpecial_backtick", testSpecial_backtick),
        ("testSpecial_colon", testSpecial_colon),
        ("testSpecial_euro", testSpecial_euro),
        ("testSpace", testSpace),
        ("testTile_hyphen", testTile_hyphen),
        ("testTile_comma_hyphen_colon", testTile_comma_hyphen_colon)

    ]
}

