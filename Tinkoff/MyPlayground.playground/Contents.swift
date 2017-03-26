//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import RxSwift
import RxCocoa


PlaygroundPage.current.needsIndefiniteExecution = true

PlaygroundPage.current.liveView = UIViewController()


//
//let triggerEvent = PublishSubject<Void>()
//let dataStream = PublishSubject<Void>()
//
////inputEvent
////  .flatMap {
////    return Observable<Void>.error(NSError(domain: "", code: 1, userInfo: nil))
////  }
//triggerEvent
//  .withLatestFrom(dataStream)
//  .debug().subscribe()
//
//
//triggerEvent.on(.next())
//dataStream.on(.next())
//triggerEvent.on(.next())
//triggerEvent.on(.next())
//
//
//let anotherEvent = PublishSubject<Void>()
//
//anotherEvent.subscribe(onNext: { _ in
//  print(Thread.current)
//})
//
//let scheduler = ConcurrentDispatchQueueScheduler(qos: .utility)
//
//Observable
//  .just()
//  .observeOn(scheduler)
//  .observeOn(MainScheduler.instance)
//  .bindTo(anotherEvent)
//
//let control = UIControl()
//
//control.rx.controlEvent(UIControlEvents.valueChanged).debug().subscribe()
//
//
//protocol Handler {
//  associatedtype T
//  func some(base: T) -> T
//}
//
//struct AnyHandler<Type> where Type: Handler, Type.T == Int {
//  
//}
//
//class A: Handler {
//  
//  typealias T = Int
//  func some(base: Int) -> Int {
//    print("value")
//    print(base)
//    return base
//  }
//  
//}
//
//let object: AnyObject = A()
//
//struct TypeWrapper<T> { }
//
//typealias H = Handler
//object.some(base: A())


//triggerEvent.asObservable().dema
