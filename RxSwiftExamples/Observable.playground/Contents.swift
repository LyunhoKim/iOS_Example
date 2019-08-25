import RxSwift

let one = 1
let two = 2
let three = 3

Observable.of([one, two, three])
    .subscribe{print($0)}

print("************")

Observable.from([one, two, three])
    .subscribe{print($0)}


print("************")

Observable.just(1)
    .subscribe {print($0)}

print("************")

Observable.range(start: 0, count: 5)
    .subscribe {print($0)}

print("************")

Observable.of([one, two, three])
//    .interval(1, scheduler: MainScheduler.instance)
    .do(onNext: { (i) in
        print(i)
    }, onError: { (err) in
        print(err.localizedDescription)
    }, onCompleted: {
        print("onCompleted")
    }, onSubscribe: {
        print("onSubscribe")
    }, onSubscribed: {
        print("onSubscribed")
    }, onDispose: {
        print("onDispose")
    })
    .subscribe { print($0) }






