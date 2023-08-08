//
//  WebViewController.swift
//  測試上升星座
//
//  Created by Hydee Chen on 2023/8/3.
//

import UIKit
//設定功能
import WebKit



class WebViewController: UIViewController {
    
    //設定webView的outlet
    @IBOutlet weak var webView: WKWebView!
    
    //設定生日型別為日期（為變數）
    var birth:Date!
    //設定各項初始值
    var sum = 0             //switch裡面的sum初始為0
    
    
    //在viewDidLoad使用updateUI()函數
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    //設定updateUI程式
    func updateUI() {
        //設定日期類型
        let dateFormatter = DateFormatter()
        //設定日期格式
        dateFormatter.dateFormat = "yyyy年MM月dd日HH時mm分"
        //把前頁birth丟到函數顯示
        let dayString = dateFormatter.string(from: birth)
        //設定畫面title顯示文字串
        title = "\(dayString)"
        //先以出生月份決定起始日
        //先各別取得月、日、時間
        //取月
        dateFormatter.dateFormat = "MM"
        let Month = dateFormatter.string(from: birth)
        let monthIndex = Int(Month) //將月字串轉為數字
        //取日
        dateFormatter.dateFormat = "dd"
        let Day = dateFormatter.string(from: birth)
        let dayIndex = Int(Day)//將日字串轉為數字
        //取時
        dateFormatter.dateFormat = "HH"
        let Hour = dateFormatter.string(from: birth)
        let hourIndex = Int(Hour)//將時字串轉為數字
        //HH 是 24 小時制、hh 是 12 小時制
        //取分
        dateFormatter.dateFormat = "mm"
        let Min = dateFormatter.string(from: birth)
        let minIndex = Int(Min)//將分字串轉為數字
        
        //計算方法： 出生月參數（見表一查詢）＋ 生日數字 × 4 ＋ 出生時間 ＝ 計算出的時間（見表二查詢）便得出上升星座。
        //計算上升星座數字，這邊因為有12種不同月份起始值，所以用switch的架構比較清楚
        switch monthIndex {
        case 1 :
            sum = ( 6 * 60 ) + 40 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
            
        case 2 :
            sum = ( 8 * 60 ) + 43 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 3 :
            sum = ( 10 * 60 ) + 33 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 4 :
            sum = ( 12 * 60 ) + 35 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 5 :
            sum = ( 14 * 60 ) + 33 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 6 :
            sum = ( 16 * 60 ) + 36 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 7 :
            sum = ( 18 * 60 ) + 34 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 8 :
            sum = ( 20 * 60 ) + 36 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 9 :
            sum = ( 22 * 60 ) + 38 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 10 :
            sum = ( 0 * 60 ) + 37 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 11 :
            sum = ( 2 * 60 ) + 39 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        case 12 :
            sum = ( 4 * 60 ) + 37 + (dayIndex! * 4) + ( hourIndex! * 60 ) + minIndex!
            if sum > 1440 {
                sum -= 1440
            }
        default :
            break
        }
        
        //接下來以finalMin和finalHour來看對應的上升星座結果，因為同時要考慮時和分，需要用到&&，所以這邊使用if的架構。
        /*
         一共有12個星座：牡羊座（Aries）、金牛座（Taurus）、雙子座（Gemini）、巨蟹座（Cancer）、獅子座（Leo）、處女座（Virgo）、天秤座（Libra）、天蠍座（Scorpio）、射手座（Sagittarius）、摩羯座（Capricorn）、水瓶座（Aquarius）、雙魚座（Pisces）
         */
        
        //以判斷式判斷上升星座
        if (18 * 60 <= sum) && (sum < 19 * 60 + 29){
            let StarSing = "aries" //牡羊座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (19 * 60 + 29 <= sum) && (sum < 21 * 60 + 11){
            let StarSing = "taurus" //金牛座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (21 * 60 + 11 <= sum) && (sum < 23 * 60 + 13){
            let StarSing = "gemini" //雙子座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (23 * 60 + 13 <= sum) && (sum < 24 * 60){
            let StarSing = "cancer"  //巨蟹座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (sum < 1 * 60 + 29){
            let StarSing = "cancer"  //巨蟹座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (1 * 60 + 29 <= sum) && (sum < 3 * 60 + 46){
            let StarSing = "leo"  //獅子座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (3 * 60 + 46 <= sum) && (sum < 6 * 60){
            let StarSing = "virgo"  //處女座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (6 * 60 <= sum) && (sum < 8 * 60 + 13){
            let StarSing = "libra"  //天平座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (8 * 60 + 13 <= sum) && (sum < 10 * 60 + 30){
            let StarSing = "scorpio"  //天蠍座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (10 * 60 + 30 <= sum) && (sum < 12 * 60 + 46){
            let StarSing = "sagittarius"  //射手座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (12 * 60 + 46 <= sum) && (sum < 14 * 60 + 48){
            let StarSing = "capricorn"  //魔羯座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (14 * 60 + 48 <= sum) && (sum < 16 * 60 + 30){
            let StarSing = "aquarius"  //水瓶座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        } else if (16 * 60 + 30 <= sum) && (sum < 18 * 60){
            let StarSing = "pisces"  //雙魚座
            //回傳網頁
            if let url = URL(string: "https://wisdom-life.in/article/star-sign/about-ascendant-\(String(StarSing))") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
