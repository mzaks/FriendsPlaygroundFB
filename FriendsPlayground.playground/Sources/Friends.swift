
// generated with FlatBuffersSchemaEditor https://github.com/mzaks/FlatBuffersSchemaEditor

import Foundation

public final class Friend {
    public static var instancePoolMutex : pthread_mutex_t = Friend.setupInstancePoolMutex()
    public static var maxInstanceCacheSize : UInt = 0
    public static var instancePool : ContiguousArray<Friend> = []
    public var name : String? {
        get {
            if let s = name_s {
                return s
            }
            if let s = name_ss {
                name_s = s.stringValue
            }
            if let s = name_b {
                name_s = String.init(bytesNoCopy: UnsafeMutablePointer<UInt8>(s.baseAddress), length: s.count, encoding: NSUTF8StringEncoding, freeWhenDone: false)
            }
            return name_s
        }
        set {
            name_s = newValue
            name_ss = nil
            name_b = nil
        }
    }
    public func nameStaticString(newValue : StaticString) {
        name_ss = newValue
        name_s = nil
        name_b = nil
    }
    private var name_b : UnsafeBufferPointer<UInt8>? = nil
    public var nameBuffer : UnsafeBufferPointer<UInt8>? {return name_b}
    private var name_s : String? = nil
    private var name_ss : StaticString? = nil
    
    public var friends : ContiguousArray<Friend?> = []
    public var father : Friend? = nil
    public var mother : Friend? = nil
    public var lover : Human? = nil
    public init(){}
    public init(name: String?, friends: ContiguousArray<Friend?>, father: Friend?, mother: Friend?, lover: Human?){
        self.name_s = name
        self.friends = friends
        self.father = father
        self.mother = mother
        self.lover = lover
    }
    public init(name: StaticString?, friends: ContiguousArray<Friend?>, father: Friend?, mother: Friend?, lover: Human?){
        self.name_ss = name
        self.friends = friends
        self.father = father
        self.mother = mother
        self.lover = lover
    }
}

extension Friend : PoolableInstances {
    public func reset() {
        name = nil
        while (friends.count > 0) {
            var x = friends.removeLast()!
            Friend.reuseInstance(&x)
        }
        if father != nil {
            var x = father!
            father = nil
            Friend.reuseInstance(&x)
        }
        if mother != nil {
            var x = mother!
            mother = nil
            Friend.reuseInstance(&x)
        }
        lover = nil
    }
}
public extension Friend {
    private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> Friend? {
        guard let objectOffset = objectOffset else {
            return nil
        }
        if reader.config.uniqueTables {
            if let o = reader.objectPool[objectOffset]{
                return o as? Friend
            }
        }
        let _result = Friend.createInstance()
        if reader.config.uniqueTables {
            reader.objectPool[objectOffset] = _result
        }
        _result.name_b = reader.getStringBuffer(reader.getOffset(objectOffset, propertyIndex: 0))
        let offset_friends : Offset? = reader.getOffset(objectOffset, propertyIndex: 1)
        let length_friends = reader.getVectorLength(offset_friends)
        if(length_friends > 0){
            var index = 0
            _result.friends.reserveCapacity(length_friends)
            while index < length_friends {
                _result.friends.append(Friend.create(reader, objectOffset: reader.getVectorOffsetElement(offset_friends!, index: index)))
                index += 1
            }
        }
        _result.father = Friend.create(reader, objectOffset: reader.getOffset(objectOffset, propertyIndex: 2))
        _result.mother = Friend.create(reader, objectOffset: reader.getOffset(objectOffset, propertyIndex: 3))
        _result.lover = create_Human(reader, propertyIndex: 4, objectOffset: objectOffset)
        return _result
    }
}
public extension Friend {
    public static func fromByteArray(data : UnsafeBufferPointer<UInt8>, config : BinaryReadConfig = BinaryReadConfig()) -> Friend {
        let reader = FlatBufferReader.create(data, config: config)
        let objectOffset = reader.rootObjectOffset
        let result = create(reader, objectOffset : objectOffset)!
        FlatBufferReader.reuse(reader)
        return result
    }
    public static func fromRawMemory(data : UnsafeMutablePointer<UInt8>, count : Int, config : BinaryReadConfig = BinaryReadConfig()) -> Friend {
        let reader = FlatBufferReader.create(data, count: count, config: config)
        let objectOffset = reader.rootObjectOffset
        let result = create(reader, objectOffset : objectOffset)!
        FlatBufferReader.reuse(reader)
        return result
    }
    public static func fromFlatBufferReader(flatBufferReader : FlatBufferReader) -> Friend {
        return create(flatBufferReader, objectOffset : flatBufferReader.rootObjectOffset)!
    }
}
public extension Friend {
    public func toByteArray (config : BinaryBuildConfig = BinaryBuildConfig()) -> [UInt8] {
        let builder = FlatBufferBuilder.create(config)
        let offset = addToByteArray(builder)
        performLateBindings(builder)
        try! builder.finish(offset, fileIdentifier: nil)
        let result = builder.data
        FlatBufferBuilder.reuse(builder)
        return result
    }
}

public extension Friend {
    public func toFlatBufferBuilder (builder : FlatBufferBuilder) -> Void {
        let offset = addToByteArray(builder)
        performLateBindings(builder)
        try! builder.finish(offset, fileIdentifier: nil)
    }
}

public extension Friend {
    public final class LazyAccess : Hashable {
        private let _reader : FlatBufferReader!
        private let _objectOffset : Offset!
        public init(data : UnsafeBufferPointer<UInt8>, config : BinaryReadConfig = BinaryReadConfig()){
            _reader = FlatBufferReader.create(data, config: config)
            _objectOffset = _reader.rootObjectOffset
        }
        deinit{
            FlatBufferReader.reuse(_reader)
        }
        public var data : [UInt8] {
            return _reader.data
        }
        private init?(reader : FlatBufferReader, objectOffset : Offset?){
            guard let objectOffset = objectOffset else {
                _reader = nil
                _objectOffset = nil
                return nil
            }
            _reader = reader
            _objectOffset = objectOffset
        }
        
        public lazy var name : String? = self._reader.getString(self._reader.getOffset(self._objectOffset, propertyIndex: 0))
        public lazy var friends : LazyVector<Friend.LazyAccess> = { [self]
            let vectorOffset : Offset? = self._reader.getOffset(self._objectOffset, propertyIndex: 1)
            let vectorLength = self._reader.getVectorLength(vectorOffset)
            let reader = self._reader
            return LazyVector(count: vectorLength){ [reader] in
                Friend.LazyAccess(reader: reader, objectOffset : reader.getVectorOffsetElement(vectorOffset!, index: $0))
            }
        }()
        public lazy var father : Friend.LazyAccess? = Friend.LazyAccess(reader: self._reader, objectOffset : self._reader.getOffset(self._objectOffset, propertyIndex: 2))
        public lazy var mother : Friend.LazyAccess? = Friend.LazyAccess(reader: self._reader, objectOffset : self._reader.getOffset(self._objectOffset, propertyIndex: 3))
        public lazy var lover : Human_LazyAccess? = create_Human_LazyAccess(self._reader, propertyIndex: 4, objectOffset: self._objectOffset)
        
        public var createEagerVersion : Friend? { return Friend.create(_reader, objectOffset: _objectOffset) }
        
        public var hashValue: Int { return Int(_objectOffset) }
    }
}

public func ==(t1 : Friend.LazyAccess, t2 : Friend.LazyAccess) -> Bool {
    return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

extension Friend {
    public struct Fast : Hashable {
        private var buffer : UnsafePointer<UInt8> = nil
        private var myOffset : Offset = 0
        public init(buffer: UnsafePointer<UInt8>, myOffset: Offset){
            self.buffer = buffer
            self.myOffset = myOffset
        }
        public init(_ data : UnsafePointer<UInt8>) {
            self.buffer = data
            self.myOffset = UnsafePointer<Offset>(buffer.advancedBy(0)).memory
        }
        public func getData() -> UnsafePointer<UInt8> {
            return buffer
        }
        public var name : UnsafeBufferPointer<UInt8>? { get { return FlatBufferReaderFast.getStringBuffer(buffer, FlatBufferReaderFast.getOffset(buffer, myOffset, propertyIndex:0)) } }
        public struct FriendsVector {
            private var buffer : UnsafePointer<UInt8> = nil
            private var myOffset : Offset = 0
            private let offsetList : Offset?
            private init(buffer b: UnsafePointer<UInt8>, myOffset o: Offset ) {
                buffer = b
                myOffset = o
                offsetList = FlatBufferReaderFast.getOffset(buffer, myOffset, propertyIndex: 1)
            }
            public var count : Int { get { return FlatBufferReaderFast.getVectorLength(buffer, offsetList) } }
            public subscript (index : Int) -> Friend.Fast? {
                get {
                    if let ofs = FlatBufferReaderFast.getVectorOffsetElement(buffer, offsetList!, index: index) {
                        return Friend.Fast(buffer: buffer, myOffset: ofs)
                    }
                    return nil
                }
            }
        }
        public lazy var friends : FriendsVector = FriendsVector(buffer: self.buffer, myOffset: self.myOffset)
        public var father : Friend.Fast? { get {
            if let offset = FlatBufferReaderFast.getOffset(buffer, myOffset, propertyIndex: 2) {
                return Friend.Fast(buffer: buffer, myOffset: offset)
            }
            return nil
            } }
        public var mother : Friend.Fast? { get {
            if let offset = FlatBufferReaderFast.getOffset(buffer, myOffset, propertyIndex: 3) {
                return Friend.Fast(buffer: buffer, myOffset: offset)
            }
            return nil
            } }
        public var lover : Human_Fast? { get {
            return create_Human_Fast(buffer, propertyIndex: 4, objectOffset: self.myOffset)
            } }
        public var hashValue: Int { return Int(myOffset) }
    }
}
public func ==(t1 : Friend.Fast, t2 : Friend.Fast) -> Bool {
    return t1.buffer == t2.buffer && t1.myOffset == t2.myOffset
}
public extension Friend {
    private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
        if builder.config.uniqueTables {
            if let myOffset = builder.cache[ObjectIdentifier(self)] {
                return myOffset
            }
        }
        if builder.inProgress.contains(ObjectIdentifier(self)){
            return 0
        }
        builder.inProgress.insert(ObjectIdentifier(self))
        let offset4 = addToByteArray_Human(builder, union: lover)
        let offset3 = mother?.addToByteArray(builder) ?? 0
        let offset2 = father?.addToByteArray(builder) ?? 0
        var offset1 = Offset(0)
        if friends.count > 0{
            var offsets = [Offset?](count: friends.count, repeatedValue: nil)
            var index = friends.count - 1
            var deferedBindingObjects : [Int : Friend] = [:]
            while(index >= 0){
                offsets[index] = friends[index]?.addToByteArray(builder)
                if offsets[index] == 0 {
                    deferedBindingObjects[index] = friends[index]!
                }
                index -= 1
            }
            try! builder.startVector(friends.count)
            index = friends.count - 1
            var deferedBindingCursors : [Int : Int] = [:]
            while(index >= 0){
                let cursor = try! builder.putOffset(offsets[index])
                if offsets[index] == 0 {
                    deferedBindingCursors[index] = cursor
                }
                index -= 1
            }
            for key in deferedBindingObjects.keys {
                builder.deferedBindings.append((object: deferedBindingObjects[key]!, cursor: deferedBindingCursors[key]!))
            }
            offset1 = builder.endVector()
        }
        // let offset0 = try! builder.createString(name)
        var offset0 : Offset
        if let s = name_b {
            offset0 = try! builder.createString(s)
        } else if let s = name_ss {
            offset0 = try! builder.createStaticString(s)
        } else {
            offset0 = try! builder.createString(name)
        }
        try! builder.openObject(6)
        if lover != nil {
            let cursor4 = try! builder.addPropertyOffsetToOpenObject(5, offset: offset4)
            if offset4 == 0 {
                builder.deferedBindings.append((object: lover!, cursor: cursor4))
            }
            try! builder.addPropertyToOpenObject(4, value : unionCase_Human(lover), defaultValue : 0)
        }
        if mother != nil {
            let cursor3 = try! builder.addPropertyOffsetToOpenObject(3, offset: offset3)
            if offset3 == 0 {
                builder.deferedBindings.append((object: mother!, cursor: cursor3))
            }
        }
        if father != nil {
            let cursor2 = try! builder.addPropertyOffsetToOpenObject(2, offset: offset2)
            if offset2 == 0 {
                builder.deferedBindings.append((object: father!, cursor: cursor2))
            }
        }
        if friends.count > 0 {
            try! builder.addPropertyOffsetToOpenObject(1, offset: offset1)
        }
        try! builder.addPropertyOffsetToOpenObject(0, offset: offset0)
        let myOffset =  try! builder.closeObject()
        if builder.config.uniqueTables {
            builder.cache[ObjectIdentifier(self)] = myOffset
        }
        builder.inProgress.remove(ObjectIdentifier(self))
        return myOffset
    }
}
public final class Male {
    public static var instancePoolMutex : pthread_mutex_t = Male.setupInstancePoolMutex()
    public static var maxInstanceCacheSize : UInt = 0
    public static var instancePool : ContiguousArray<Male> = []
    public var ref : Friend? = nil
    public init(){}
    public init(ref: Friend?){
        self.ref = ref
    }
}

extension Male : PoolableInstances {
    public func reset() {
        if ref != nil {
            var x = ref!
            ref = nil
            Friend.reuseInstance(&x)
        }
    }
}
public extension Male {
    private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> Male? {
        guard let objectOffset = objectOffset else {
            return nil
        }
        if reader.config.uniqueTables {
            if let o = reader.objectPool[objectOffset]{
                return o as? Male
            }
        }
        let _result = Male.createInstance()
        if reader.config.uniqueTables {
            reader.objectPool[objectOffset] = _result
        }
        _result.ref = Friend.create(reader, objectOffset: reader.getOffset(objectOffset, propertyIndex: 0))
        return _result
    }
}
public extension Male {
    public final class LazyAccess : Hashable {
        private let _reader : FlatBufferReader!
        private let _objectOffset : Offset!
        private init?(reader : FlatBufferReader, objectOffset : Offset?){
            guard let objectOffset = objectOffset else {
                _reader = nil
                _objectOffset = nil
                return nil
            }
            _reader = reader
            _objectOffset = objectOffset
        }
        
        public lazy var ref : Friend.LazyAccess? = Friend.LazyAccess(reader: self._reader, objectOffset : self._reader.getOffset(self._objectOffset, propertyIndex: 0))
        
        public var createEagerVersion : Male? { return Male.create(_reader, objectOffset: _objectOffset) }
        
        public var hashValue: Int { return Int(_objectOffset) }
    }
}

public func ==(t1 : Male.LazyAccess, t2 : Male.LazyAccess) -> Bool {
    return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

extension Male {
    public struct Fast : Hashable {
        private var buffer : UnsafePointer<UInt8> = nil
        private var myOffset : Offset = 0
        public init(buffer: UnsafePointer<UInt8>, myOffset: Offset){
            self.buffer = buffer
            self.myOffset = myOffset
        }
        public var ref : Friend.Fast? { get {
            if let offset = FlatBufferReaderFast.getOffset(buffer, myOffset, propertyIndex: 0) {
                return Friend.Fast(buffer: buffer, myOffset: offset)
            }
            return nil
            } }
        public var hashValue: Int { return Int(myOffset) }
    }
}
public func ==(t1 : Male.Fast, t2 : Male.Fast) -> Bool {
    return t1.buffer == t2.buffer && t1.myOffset == t2.myOffset
}
public extension Male {
    private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
        if builder.config.uniqueTables {
            if let myOffset = builder.cache[ObjectIdentifier(self)] {
                return myOffset
            }
        }
        if builder.inProgress.contains(ObjectIdentifier(self)){
            return 0
        }
        builder.inProgress.insert(ObjectIdentifier(self))
        let offset0 = ref?.addToByteArray(builder) ?? 0
        try! builder.openObject(1)
        if ref != nil {
            let cursor0 = try! builder.addPropertyOffsetToOpenObject(0, offset: offset0)
            if offset0 == 0 {
                builder.deferedBindings.append((object: ref!, cursor: cursor0))
            }
        }
        let myOffset =  try! builder.closeObject()
        if builder.config.uniqueTables {
            builder.cache[ObjectIdentifier(self)] = myOffset
        }
        builder.inProgress.remove(ObjectIdentifier(self))
        return myOffset
    }
}
public final class Female {
    public static var instancePoolMutex : pthread_mutex_t = Female.setupInstancePoolMutex()
    public static var maxInstanceCacheSize : UInt = 0
    public static var instancePool : ContiguousArray<Female> = []
    public var ref : Friend? = nil
    public init(){}
    public init(ref: Friend?){
        self.ref = ref
    }
}

extension Female : PoolableInstances {
    public func reset() {
        if ref != nil {
            var x = ref!
            ref = nil
            Friend.reuseInstance(&x)
        }
    }
}
public extension Female {
    private static func create(reader : FlatBufferReader, objectOffset : Offset?) -> Female? {
        guard let objectOffset = objectOffset else {
            return nil
        }
        if reader.config.uniqueTables {
            if let o = reader.objectPool[objectOffset]{
                return o as? Female
            }
        }
        let _result = Female.createInstance()
        if reader.config.uniqueTables {
            reader.objectPool[objectOffset] = _result
        }
        _result.ref = Friend.create(reader, objectOffset: reader.getOffset(objectOffset, propertyIndex: 0))
        return _result
    }
}
public extension Female {
    public final class LazyAccess : Hashable {
        private let _reader : FlatBufferReader!
        private let _objectOffset : Offset!
        private init?(reader : FlatBufferReader, objectOffset : Offset?){
            guard let objectOffset = objectOffset else {
                _reader = nil
                _objectOffset = nil
                return nil
            }
            _reader = reader
            _objectOffset = objectOffset
        }
        
        public lazy var ref : Friend.LazyAccess? = Friend.LazyAccess(reader: self._reader, objectOffset : self._reader.getOffset(self._objectOffset, propertyIndex: 0))
        
        public var createEagerVersion : Female? { return Female.create(_reader, objectOffset: _objectOffset) }
        
        public var hashValue: Int { return Int(_objectOffset) }
    }
}

public func ==(t1 : Female.LazyAccess, t2 : Female.LazyAccess) -> Bool {
    return t1._objectOffset == t2._objectOffset && t1._reader === t2._reader
}

extension Female {
    public struct Fast : Hashable {
        private var buffer : UnsafePointer<UInt8> = nil
        private var myOffset : Offset = 0
        public init(buffer: UnsafePointer<UInt8>, myOffset: Offset){
            self.buffer = buffer
            self.myOffset = myOffset
        }
        public var ref : Friend.Fast? { get {
            if let offset = FlatBufferReaderFast.getOffset(buffer, myOffset, propertyIndex: 0) {
                return Friend.Fast(buffer: buffer, myOffset: offset)
            }
            return nil
            } }
        public var hashValue: Int { return Int(myOffset) }
    }
}
public func ==(t1 : Female.Fast, t2 : Female.Fast) -> Bool {
    return t1.buffer == t2.buffer && t1.myOffset == t2.myOffset
}
public extension Female {
    private func addToByteArray(builder : FlatBufferBuilder) -> Offset {
        if builder.config.uniqueTables {
            if let myOffset = builder.cache[ObjectIdentifier(self)] {
                return myOffset
            }
        }
        if builder.inProgress.contains(ObjectIdentifier(self)){
            return 0
        }
        builder.inProgress.insert(ObjectIdentifier(self))
        let offset0 = ref?.addToByteArray(builder) ?? 0
        try! builder.openObject(1)
        if ref != nil {
            let cursor0 = try! builder.addPropertyOffsetToOpenObject(0, offset: offset0)
            if offset0 == 0 {
                builder.deferedBindings.append((object: ref!, cursor: cursor0))
            }
        }
        let myOffset =  try! builder.closeObject()
        if builder.config.uniqueTables {
            builder.cache[ObjectIdentifier(self)] = myOffset
        }
        builder.inProgress.remove(ObjectIdentifier(self))
        return myOffset
    }
}
public protocol Human{}
public protocol Human_LazyAccess{}
public protocol Human_Fast{}
extension Male : Human {}
extension Male.LazyAccess : Human_LazyAccess {}
extension Male.Fast : Human_Fast {}
extension Female : Human {}
extension Female.LazyAccess : Human_LazyAccess {}
extension Female.Fast : Human_Fast {}
private func create_Human(reader : FlatBufferReader, propertyIndex : Int, objectOffset : Offset?) -> Human? {
    guard let objectOffset = objectOffset else {
        return nil
    }
    let unionCase : Int8 = reader.get(objectOffset, propertyIndex: propertyIndex, defaultValue: 0)
    guard let caseObjectOffset : Offset = reader.getOffset(objectOffset, propertyIndex:propertyIndex + 1) else {
        return nil
    }
    switch unionCase {
    case 1 : return Male.create(reader, objectOffset: caseObjectOffset)
    case 2 : return Female.create(reader, objectOffset: caseObjectOffset)
    default : return nil
    }
}
private func create_Human_LazyAccess(reader : FlatBufferReader, propertyIndex : Int, objectOffset : Offset?) -> Human_LazyAccess? {
    guard let objectOffset = objectOffset else {
        return nil
    }
    let unionCase : Int8 = reader.get(objectOffset, propertyIndex: propertyIndex, defaultValue: 0)
    guard let caseObjectOffset : Offset = reader.getOffset(objectOffset, propertyIndex:propertyIndex + 1) else {
        return nil
    }
    switch unionCase {
    case 1 : return Male.LazyAccess(reader: reader, objectOffset: caseObjectOffset)
    case 2 : return Female.LazyAccess(reader: reader, objectOffset: caseObjectOffset)
    default : return nil
    }
}
private func create_Human_Fast(buffer : UnsafePointer<UInt8>, propertyIndex : Int, objectOffset : Offset?) -> Human_Fast? {
    guard let objectOffset = objectOffset else {
        return nil
    }
    let unionCase : Int8 = FlatBufferReaderFast.get(buffer, objectOffset, propertyIndex: propertyIndex, defaultValue: 0)
    guard let caseObjectOffset : Offset = FlatBufferReaderFast.getOffset(buffer, objectOffset, propertyIndex:propertyIndex + 1) else {
        return nil
    }
    switch unionCase {
    case 1 : return Male.Fast(buffer: buffer, myOffset: caseObjectOffset)
    case 2 : return Female.Fast(buffer: buffer, myOffset: caseObjectOffset)
    default : return nil
    }
}
private func unionCase_Human(union : Human?) -> Int8 {
    switch union {
    case is Male : return 1
    case is Female : return 2
    default : return 0
    }
}
private func addToByteArray_Human(builder : FlatBufferBuilder, union : Human?) -> Offset {
    switch union {
    case let u as Male : return u.addToByteArray(builder)
    case let u as Female : return u.addToByteArray(builder)
    default : return 0
    }
}
private func performLateBindings(builder : FlatBufferBuilder) {
    for binding in builder.deferedBindings {
        switch binding.object {
        case let object as Friend: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
        case let object as Male: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
        case let object as Female: try! builder.replaceOffset(object.addToByteArray(builder), atCursor: binding.cursor)
        default: continue
        }
    }
}
// MARK: Generic Type Definitions
public typealias Offset = Int32

public protocol Scalar : Equatable {}

extension Scalar {
    var littleEndian : Self {
        switch self {
        case let v as Int16 : return v.littleEndian as! Self
        case let v as UInt16 : return v.littleEndian as! Self
        case let v as Int32 : return v.littleEndian as! Self
        case let v as UInt32 : return v.littleEndian as! Self
        case let v as Int64 : return v.littleEndian as! Self
        case let v as UInt64 : return v.littleEndian as! Self
        case let v as Int : return v.littleEndian as! Self
        case let v as UInt : return v.littleEndian as! Self
        default : return self
        }
    }
}

extension Bool : Scalar {}
extension Int8 : Scalar {}
extension UInt8 : Scalar {}
extension Int16 : Scalar {}
extension UInt16 : Scalar {}
extension Int32 : Scalar {}
extension UInt32 : Scalar {}
extension Int64 : Scalar {}
extension UInt64 : Scalar {}
extension Int : Scalar {}
extension UInt : Scalar {}
extension Float32 : Scalar {}
extension Float64 : Scalar {}

public protocol PoolableInstances : AnyObject {
    static var maxInstanceCacheSize : UInt { get set }
    static var instancePool : ContiguousArray<Self> { get set }
    static var instancePoolMutex : pthread_mutex_t { get set } /// Should be initialized to setupInstancePoolMutex
    init()
    func reset()
}

public extension PoolableInstances {
    
    // Must be called to initialize mutex
    public static func setupInstancePoolMutex() -> pthread_mutex_t
    {
        var mtx = pthread_mutex_t()
        pthread_mutex_init(&mtx, nil)
        return mtx
    }
    
    // Optional preheat of instance pool
    public static func fillInstancePool(initialPoolSize : UInt) -> Void {
        pthread_mutex_lock(&instancePoolMutex)
        defer { pthread_mutex_unlock(&instancePoolMutex) }
        
        while ((UInt(instancePool.count) < initialPoolSize) && (UInt(instancePool.count) < maxInstanceCacheSize))
        {
            instancePool.append(Self())
        }
    }
    
    public static func createInstance() -> Self {
        guard maxInstanceCacheSize > 0 else // avoid taking the mutex if not using pool
        {
            return Self()
        }
        
        pthread_mutex_lock(&instancePoolMutex)
        defer { pthread_mutex_unlock(&instancePoolMutex) }
        
        if (instancePool.count > 0)
        {
            let instance = instancePool.removeLast()
            return instance
        }
        return Self()
    }
    
    // reuseInstance can be called when we believe we are about to zero out
    // the final strong reference we hold ourselves to put the instance in for reuse
    public static func reuseInstance(inout instance : Self) {
        guard maxInstanceCacheSize > 0 else // avoid taking the mutex if not using pool
        {
            return // don't pool
        }
        
        pthread_mutex_lock(&instancePoolMutex)
        defer { pthread_mutex_unlock(&instancePoolMutex) }
        
        if (isUniquelyReferencedNonObjC(&instance) && (UInt(instancePool.count) < maxInstanceCacheSize))
        {
            instance.reset()
            instancePool.append(instance)
        }
    }
}



public final class LazyVector<T> : SequenceType {
    
    private let _generator : (Int)->T?
    private let _replacer : ((Int, T)->())?
    private let _count : Int
    
    public init(count : Int, _ generator : (Int)->T?){
        _generator = generator
        _count = count
        _replacer = nil
    }
    
    public init(count : Int, _ generator : (Int)->T?, _ replacer: ((Int, T)->())? = nil){
        _generator = generator
        _count = count
        _replacer = replacer
    }
    
    public subscript(i: Int) -> T? {
        get {
            guard i >= 0 && i < _count else {
                return nil
            }
            return _generator(i)
        }
        set {
            guard let replacer = _replacer, let value = newValue else {
                return
            }
            guard i >= 0 && i < _count else {
                return
            }
            replacer(i, value)
        }
    }
    
    public var count : Int {return _count}
    
    public func generate() -> AnyGenerator<T> {
        var index = 0
        
        return AnyGenerator(body: { [self]
            let value = self[index]
            index += 1
            return value
        })
    }
}

public struct BinaryBuildConfig{
    public let initialCapacity : Int
    public let uniqueStrings : Bool
    public let uniqueTables : Bool
    public let uniqueVTables : Bool
    public let forceDefaults : Bool
    public init(initialCapacity : Int = 1, uniqueStrings : Bool = true, uniqueTables : Bool = true, uniqueVTables : Bool = true, forceDefaults : Bool = false) {
        self.initialCapacity = initialCapacity
        self.uniqueStrings = uniqueStrings
        self.uniqueTables = uniqueTables
        self.uniqueVTables = uniqueVTables
        self.forceDefaults = forceDefaults
    }
}

public struct BinaryReadConfig {
    public let uniqueTables : Bool
    public let uniqueStrings : Bool
    public init(uniqueStrings : Bool = true, uniqueTables : Bool = true) {
        self.uniqueStrings = uniqueStrings
        self.uniqueTables = uniqueTables
    }
}

// MARK: Reader
public enum FlatBufferReaderError : ErrorType {
    case CanOnlySetNonDefaultProperty
}

public final class FlatBufferReader {
    
    public static var maxInstanceCacheSize : UInt = 0 // max number of cached instances
    static var instancePool : [FlatBufferReader] = []
    
    public var config : BinaryReadConfig
    
    var buffer : UnsafeMutablePointer<UInt8> = nil
    public var objectPool : [Offset : AnyObject] = [:]
    
    func fromByteArray<T : Scalar>(position : Int) -> T{
        return UnsafePointer<T>(buffer.advancedBy(position)).memory
    }
    
    private var length : Int
    public var data : [UInt8] {
        return Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>(buffer), count: length))
    }
    
    public init(buffer : [UInt8], config: BinaryReadConfig){
        self.buffer = UnsafeMutablePointer<UInt8>(buffer)
        self.config = config
        length = buffer.count
    }
    
    public init(bytes : UnsafeBufferPointer<UInt8>, config: BinaryReadConfig){
        self.buffer = UnsafeMutablePointer<UInt8>(bytes.baseAddress)
        self.config = config
        length = bytes.count
    }
    
    public init(bytes : UnsafeMutablePointer<UInt8>, count : Int, config: BinaryReadConfig){
        self.buffer = bytes
        self.config = config
        length = count
    }
    
    public var rootObjectOffset : Offset {
        let offset : Int32 = fromByteArray(0)
        return offset
    }
    
    public func get<T : Scalar>(objectOffset : Offset, propertyIndex : Int, defaultValue : T) -> T{
        let propertyOffset = getPropertyOffset(objectOffset, propertyIndex: propertyIndex)
        if propertyOffset == 0 {
            return defaultValue
        }
        let position = Int(objectOffset + propertyOffset)
        return fromByteArray(position)
    }
    
    public func get<T : Scalar>(objectOffset : Offset, propertyIndex : Int) -> T?{
        let propertyOffset = getPropertyOffset(objectOffset, propertyIndex: propertyIndex)
        if propertyOffset == 0 {
            return nil
        }
        let position = Int(objectOffset + propertyOffset)
        return fromByteArray(position) as T
    }
    
    public func set<T : Scalar>(objectOffset : Offset, propertyIndex : Int, value : T) throws {
        let propertyOffset = getPropertyOffset(objectOffset, propertyIndex: propertyIndex)
        if propertyOffset == 0 {
            throw FlatBufferReaderError.CanOnlySetNonDefaultProperty
        }
        var v = value
        let position = Int(objectOffset + propertyOffset)
        let c = strideofValue(v)
        withUnsafePointer(&v){
            buffer.advancedBy(position).assignFrom(UnsafeMutablePointer<UInt8>($0), count: c)
        }
    }
    
    public func hasProperty(objectOffset : Offset, propertyIndex : Int) -> Bool {
        return getPropertyOffset(objectOffset, propertyIndex: propertyIndex) != 0
    }
    
    public func getOffset(objectOffset : Offset, propertyIndex : Int) -> Offset?{
        let propertyOffset = getPropertyOffset(objectOffset, propertyIndex: propertyIndex)
        if propertyOffset == 0 {
            return nil
        }
        let position = objectOffset + propertyOffset
        let localObjectOffset : Int32 = fromByteArray(Int(position))
        let offset = position + localObjectOffset
        
        if localObjectOffset == 0 {
            return nil
        }
        return offset
    }
    
    var stringCache : [Int32:String] = [:]
    
    public func getString(stringOffset : Offset?) -> String? {
        guard let stringOffset = stringOffset else {
            return nil
        }
        if config.uniqueStrings {
            if let result = stringCache[stringOffset]{
                return result
            }
        }
        
        let stringPosition = Int(stringOffset)
        let stringLength : Int32 = fromByteArray(stringPosition)
        
        let pointer = UnsafeMutablePointer<UInt8>(buffer).advancedBy((stringPosition + strideof(Int32)))
        let result = String.init(bytesNoCopy: pointer, length: Int(stringLength), encoding: NSUTF8StringEncoding, freeWhenDone: false)
        
        if config.uniqueStrings {
            stringCache[stringOffset] = result
        }
        return result
    }
    
    public func getStringBuffer(stringOffset : Offset?) -> UnsafeBufferPointer<UInt8>? {
        guard let stringOffset = stringOffset else {
            return nil
        }
        let stringPosition = Int(stringOffset)
        let stringLength : Int32 = fromByteArray(stringPosition)
        let pointer = UnsafePointer<UInt8>(buffer).advancedBy((stringPosition + strideof(Int32)))
        return UnsafeBufferPointer<UInt8>.init(start: pointer, count: Int(stringLength))
    }
    
    public func getVectorLength(vectorOffset : Offset?) -> Int {
        guard let vectorOffset = vectorOffset else {
            return 0
        }
        let vectorPosition = Int(vectorOffset)
        let length2 : Int32 = fromByteArray(vectorPosition)
        return Int(length2)
    }
    
    public func getVectorScalarElement<T : Scalar>(vectorOffset : Offset, index : Int) -> T {
        let valueStartPosition = Int(vectorOffset + strideof(Int32) + (index * strideof(T)))
        return UnsafePointer<T>(UnsafePointer<UInt8>(buffer).advancedBy(valueStartPosition)).memory
    }
    
    public func setVectorScalarElement<T : Scalar>(vectorOffset : Offset, index : Int, value : T) {
        let valueStartPosition = Int(vectorOffset + strideof(Int32) + (index * strideof(T)))
        var v = value
        let c = strideofValue(v)
        withUnsafePointer(&v){
            buffer.advancedBy(valueStartPosition).assignFrom(UnsafeMutablePointer<UInt8>($0), count: c)
        }
    }
    
    public func getVectorOffsetElement(vectorOffset : Offset, index : Int) -> Offset? {
        let valueStartPosition = Int(vectorOffset + strideof(Int32) + (index * strideof(Int32)))
        let localOffset : Int32 = fromByteArray(valueStartPosition)
        if(localOffset == 0){
            return nil
        }
        return localOffset + valueStartPosition
    }
    
    private func getPropertyOffset(objectOffset : Offset, propertyIndex : Int)->Int {
        let offset = Int(objectOffset)
        let localOffset : Int32 = fromByteArray(offset)
        let vTableOffset : Int = offset - Int(localOffset)
        let vTableLength : Int16 = fromByteArray(vTableOffset)
        if(vTableLength<=Int16(4 + propertyIndex * 2)) {
            return 0
        }
        let propertyStart = vTableOffset + 4 + (2 * propertyIndex)
        
        let propertyOffset : Int16 = fromByteArray(propertyStart)
        return Int(propertyOffset)
    }
}

public extension FlatBufferReader {
    public func reset ()
    {
        buffer = nil
        objectPool.removeAll(keepCapacity: true)
        stringCache.removeAll(keepCapacity: true)
        length = 0
    }
    
    public static func create(buffer : [UInt8], config: BinaryReadConfig) -> FlatBufferReader {
        objc_sync_enter(instancePool)
        defer { objc_sync_exit(instancePool) }
        
        if (instancePool.count > 0)
        {
            let reader = instancePool.removeLast()
            
            reader.buffer = UnsafeMutablePointer<UInt8>(buffer)
            reader.config = config
            reader.length = buffer.count
            
            return reader
        }
        
        return FlatBufferReader(buffer: buffer, config: config)
    }
    
    public static func create(bytes : UnsafeBufferPointer<UInt8>, config: BinaryReadConfig) -> FlatBufferReader {
        objc_sync_enter(instancePool)
        defer { objc_sync_exit(instancePool) }
        
        if (instancePool.count > 0)
        {
            let reader = instancePool.removeLast()
            
            reader.buffer = UnsafeMutablePointer(bytes.baseAddress)
            reader.config = config
            reader.length = bytes.count
            
            return reader
        }
        
        return FlatBufferReader(bytes: bytes, config: config)
    }
    
    public static func create(bytes : UnsafeMutablePointer<UInt8>, count : Int, config: BinaryReadConfig) -> FlatBufferReader {
        objc_sync_enter(instancePool)
        defer { objc_sync_exit(instancePool) }
        
        if (instancePool.count > 0)
        {
            let reader = instancePool.removeLast()
            
            reader.buffer = bytes
            reader.config = config
            reader.length = count
            
            return reader
        }
        
        return FlatBufferReader(bytes: bytes, count: count, config: config)
    }
    
    public static func reuse(reader : FlatBufferReader) {
        objc_sync_enter(instancePool)
        defer { objc_sync_exit(instancePool) }
        
        if (UInt(instancePool.count) < maxInstanceCacheSize)
        {
            reader.reset()
            instancePool.append(reader)
        }
    }
}


// MARK: Fast Reader

public final class FlatBufferReaderFast {
    
    public static func fromByteArray<T : Scalar>(buffer : UnsafePointer<UInt8>, _ position : Int) -> T{
        return UnsafePointer<T>(buffer.advancedBy(position)).memory
    }
    
    public static func getPropertyOffset(buffer : UnsafePointer<UInt8>, _ objectOffset : Offset, propertyIndex : Int)->Int {
        let offset = Int(objectOffset)
        let localOffset : Int32 = fromByteArray(buffer, offset)
        let vTableOffset : Int = offset - Int(localOffset)
        let vTableLength : Int16 = fromByteArray(buffer, vTableOffset)
        if(vTableLength<=Int16(4 + propertyIndex * 2)) {
            return 0
        }
        let propertyStart = vTableOffset + 4 + (2 * propertyIndex)
        
        let propertyOffset : Int16 = fromByteArray(buffer, propertyStart)
        return Int(propertyOffset)
    }
    
    public static func getOffset(buffer : UnsafePointer<UInt8>, _ objectOffset : Offset, propertyIndex : Int) -> Offset?{
        let propertyOffset = getPropertyOffset(buffer, objectOffset, propertyIndex: propertyIndex)
        if propertyOffset == 0 {
            return nil
        }
        let position = objectOffset + propertyOffset
        let localObjectOffset : Int32 = fromByteArray(buffer, Int(position))
        let offset = position + localObjectOffset
        
        if localObjectOffset == 0 {
            return nil
        }
        return offset
    }
    
    public static func getVectorLength(buffer : UnsafePointer<UInt8>, _ vectorOffset : Offset?) -> Int {
        guard let vectorOffset = vectorOffset else {
            return 0
        }
        let vectorPosition = Int(vectorOffset)
        let length2 : Int32 = fromByteArray(buffer, vectorPosition)
        return Int(length2)
    }
    
    public static func getVectorOffsetElement(buffer : UnsafePointer<UInt8>, _ vectorOffset : Offset, index : Int) -> Offset? {
        let valueStartPosition = Int(vectorOffset + strideof(Int32) + (index * strideof(Int32)))
        let localOffset : Int32 = fromByteArray(buffer, valueStartPosition)
        if(localOffset == 0){
            return nil
        }
        return localOffset + valueStartPosition
    }
    
    public static func getVectorScalarElement<T : Scalar>(buffer : UnsafePointer<UInt8>, _ vectorOffset : Offset, index : Int) -> T {
        let valueStartPosition = Int(vectorOffset + strideof(Int32) + (index * strideof(T)))
        return UnsafePointer<T>(UnsafePointer<UInt8>(buffer).advancedBy(valueStartPosition)).memory
    }
    
    public static func get<T : Scalar>(buffer : UnsafePointer<UInt8>, _ objectOffset : Offset, propertyIndex : Int, defaultValue : T) -> T{
        let propertyOffset = getPropertyOffset(buffer, objectOffset, propertyIndex: propertyIndex)
        if propertyOffset == 0 {
            return defaultValue
        }
        let position = Int(objectOffset + propertyOffset)
        return fromByteArray(buffer, position)
    }
    
    public static func get<T : Scalar>(buffer : UnsafePointer<UInt8>, _ objectOffset : Offset, propertyIndex : Int) -> T?{
        let propertyOffset = getPropertyOffset(buffer, objectOffset, propertyIndex: propertyIndex)
        if propertyOffset == 0 {
            return nil
        }
        let position = Int(objectOffset + propertyOffset)
        return fromByteArray(buffer, position) as T
    }
    
    public static func getStringBuffer(buffer : UnsafePointer<UInt8>, _ stringOffset : Offset?) -> UnsafeBufferPointer<UInt8>? {
        guard let stringOffset = stringOffset else {
            return nil
        }
        let stringPosition = Int(stringOffset)
        let stringLength : Int32 = fromByteArray(buffer, stringPosition)
        let pointer = UnsafePointer<UInt8>(buffer).advancedBy((stringPosition + strideof(Int32)))
        return UnsafeBufferPointer<UInt8>.init(start: pointer, count: Int(stringLength))
    }
    
    public static func getString(buffer : UnsafePointer<UInt8>, _ stringOffset : Offset?) -> String? {
        guard let stringOffset = stringOffset else {
            return nil
        }
        let stringPosition = Int(stringOffset)
        let stringLength : Int32 = fromByteArray(buffer, stringPosition)
        
        let pointer = UnsafeMutablePointer<UInt8>(buffer).advancedBy((stringPosition + strideof(Int32)))
        let result = String.init(bytesNoCopy: pointer, length: Int(stringLength), encoding: NSUTF8StringEncoding, freeWhenDone: false)
        
        return result
    }
    
    public static func set<T : Scalar>(buffer : UnsafeMutablePointer<UInt8>, _ objectOffset : Offset, propertyIndex : Int, value : T) throws {
        let propertyOffset = getPropertyOffset(buffer, objectOffset, propertyIndex: propertyIndex)
        if propertyOffset == 0 {
            throw FlatBufferReaderError.CanOnlySetNonDefaultProperty
        }
        var v = value
        let position = Int(objectOffset + propertyOffset)
        let c = strideofValue(v)
        withUnsafePointer(&v){
            buffer.advancedBy(position).assignFrom(UnsafeMutablePointer<UInt8>($0), count: c)
        }
    }
    
    public static func setVectorScalarElement<T : Scalar>(buffer : UnsafeMutablePointer<UInt8>, _ vectorOffset : Offset, index : Int, value : T) {
        let valueStartPosition = Int(vectorOffset + strideof(Int32) + (index * strideof(T)))
        var v = value
        let c = strideofValue(v)
        withUnsafePointer(&v){
            buffer.advancedBy(valueStartPosition).assignFrom(UnsafeMutablePointer<UInt8>($0), count: c)
        }
    }
    
}


// MARK: Builder
public enum FlatBufferBuilderError : ErrorType {
    case ObjectIsNotClosed
    case NoOpenObject
    case PropertyIndexIsInvalid
    case OffsetIsTooBig
    case CursorIsInvalid
    case BadFileIdentifier
    case UnsupportedType
}

public final class FlatBufferBuilder {
    
    public static var maxInstanceCacheSize : UInt = 0 // max number of cached instances
    static var instancePool : [FlatBufferBuilder] = []
    
    public var cache : [ObjectIdentifier : Offset] = [:]
    public var inProgress : Set<ObjectIdentifier> = []
    public var deferedBindings : ContiguousArray<(object:Any, cursor:Int)> = []
    
    public var config : BinaryBuildConfig
    
    var capacity : Int
    private var _data : UnsafeMutablePointer<UInt8>
    public var _dataCount : Int { return cursor } // count of bytes in unsafe buffer
    public var _dataStart : UnsafeMutablePointer<UInt8> { return _data.advancedBy(leftCursor) } // start of actual raw unsafe buffer data
    public var data : [UInt8] {
        return Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>(_data).advancedBy(leftCursor), count: cursor))
    }
    var cursor = 0
    var leftCursor : Int {
        return capacity - cursor
    }
    
    var currentVTable : ContiguousArray<Int32> = []
    var objectStart : Int32 = -1
    var vectorNumElems : Int32 = -1;
    var vTableOffsets : ContiguousArray<Int32> = []
    
    public init(config : BinaryBuildConfig){
        self.config = config
        self.capacity = config.initialCapacity
        _data = UnsafeMutablePointer.alloc(capacity)
    }
    
    deinit {
        _data.dealloc(capacity)
    }
    
    private func increaseCapacity(size : Int){
        guard leftCursor <= size else {
            return
        }
        let _leftCursor = leftCursor
        let _capacity = capacity
        while leftCursor <= size {
            capacity = capacity << 1
        }
        
        let newData = UnsafeMutablePointer<UInt8>.alloc(capacity)
        newData.advancedBy(leftCursor).initializeFrom(_data.advancedBy(_leftCursor), count: cursor)
        _data.dealloc(_capacity)
        _data = newData
    }
    
    public func put<T : Scalar>(value : T){
        var v = value
        if UInt32(CFByteOrderGetCurrent()) == CFByteOrderBigEndian.rawValue{
            v = value.littleEndian
        }
        let c = strideofValue(v)
        increaseCapacity(c)
        withUnsafePointer(&v){
            _data.advancedBy(leftCursor-c).assignFrom(UnsafeMutablePointer<UInt8>($0), count: c)
        }
        cursor += c
        
    }
    
    public func put<T : Scalar>(value : UnsafePointer<T>, length : Int){
        increaseCapacity(length)
        _data.advancedBy(leftCursor-length).assignFrom(UnsafeMutablePointer<UInt8>(value), count: length)
        cursor += length
    }
    
    public func putOffset(offset : Offset?) throws -> Int { // make offset relative and put it into byte buffer
        guard let offset = offset else {
            put(Offset(0))
            return cursor
        }
        guard offset <= Int32(cursor) else {
            throw FlatBufferBuilderError.OffsetIsTooBig
        }
        
        if offset == Int32(0) {
            put(Offset(0))
            return cursor
        }
        let _offset = Int32(cursor) - offset + strideof(Int32);
        put(_offset)
        return cursor
    }
    
    public func replaceOffset(offset : Offset, atCursor jumpCursor: Int) throws{
        guard offset <= Int32(cursor) else {
            throw FlatBufferBuilderError.OffsetIsTooBig
        }
        guard jumpCursor <= cursor else {
            throw FlatBufferBuilderError.CursorIsInvalid
        }
        let _offset = Int32(jumpCursor) - offset;
        
        var v = _offset
        if UInt32(CFByteOrderGetCurrent()) == CFByteOrderBigEndian.rawValue{
            v = _offset.littleEndian
        }
        let c = strideofValue(v)
        withUnsafePointer(&v){
            _data.advancedBy((capacity - jumpCursor)).assignFrom(UnsafeMutablePointer<UInt8>($0), count: c)
        }
    }
    
    private func put<T : Scalar>(value : T, at index : Int){
        var v = value
        if UInt32(CFByteOrderGetCurrent()) == CFByteOrderBigEndian.rawValue{
            v = value.littleEndian
        }
        let c = strideofValue(v)
        withUnsafePointer(&v){
            _data.advancedBy(index + leftCursor).assignFrom(UnsafeMutablePointer<UInt8>($0), count: c)
        }
    }
    
    public func openObject(numOfProperties : Int) throws {
        guard objectStart == -1 && vectorNumElems == -1 else {
            throw FlatBufferBuilderError.ObjectIsNotClosed
        }
        currentVTable.removeAll(keepCapacity: true)
        currentVTable.reserveCapacity(numOfProperties)
        for _ in 0..<numOfProperties {
            currentVTable.append(0)
        }
        objectStart = Int32(cursor)
    }
    
    public func addPropertyOffsetToOpenObject(propertyIndex : Int, offset : Offset) throws -> Int{
        guard objectStart > -1 else {
            throw FlatBufferBuilderError.NoOpenObject
        }
        guard propertyIndex >= 0 && propertyIndex < currentVTable.count else {
            throw FlatBufferBuilderError.PropertyIndexIsInvalid
        }
        try putOffset(offset)
        currentVTable[propertyIndex] = Int32(cursor)
        return cursor
    }
    
    public func addPropertyToOpenObject<T : Scalar>(propertyIndex : Int, value : T, defaultValue : T) throws {
        guard objectStart > -1 else {
            throw FlatBufferBuilderError.NoOpenObject
        }
        guard propertyIndex >= 0 && propertyIndex < currentVTable.count else {
            throw FlatBufferBuilderError.PropertyIndexIsInvalid
        }
        
        if(config.forceDefaults == false && value == defaultValue) {
            return
        }
        
        put(value)
        currentVTable[propertyIndex] = Int32(cursor)
    }
    
    public func addCurrentOffsetAsPropertyToOpenObject(propertyIndex : Int) throws {
        guard objectStart > -1 else {
            throw FlatBufferBuilderError.NoOpenObject
        }
        guard propertyIndex >= 0 && propertyIndex < currentVTable.count else {
            throw FlatBufferBuilderError.PropertyIndexIsInvalid
        }
        currentVTable[propertyIndex] = Int32(cursor)
    }
    
    public func closeObject() throws -> Offset {
        guard objectStart > -1 else {
            throw FlatBufferBuilderError.NoOpenObject
        }
        
        increaseCapacity(4)
        cursor += 4 // Will be set to vtable offset afterwards
        
        let vtableloc = cursor
        
        // vtable is stored as relative offset for object data
        var index = currentVTable.count - 1
        while(index>=0) {
            // Offset relative to the start of the table.
            let off = Int16(currentVTable[index] != 0 ? Int32(vtableloc) - currentVTable[index] : 0);
            put(off);
            index -= 1
        }
        
        let numberOfstandardFields = 2
        
        put(Int16(Int32(vtableloc) - objectStart)); // standard field 1: lenght of the object data
        put(Int16((currentVTable.count + numberOfstandardFields) * strideof(Int16))); // standard field 2: length of vtable and standard fields them selves
        
        // search if we already have same vtable
        let vtableDataLength = cursor - vtableloc
        
        var foundVTableOffset = vtableDataLength
        
        if config.uniqueVTables{
            for otherVTableOffset in vTableOffsets {
                let start = cursor - Int(otherVTableOffset)
                var found = true
                for i in 0 ..< vtableDataLength {
                    let a = _data.advancedBy(leftCursor + i).memory
                    let b = _data.advancedBy(leftCursor + i + start).memory
                    if a != b {
                        found = false
                        break;
                    }
                }
                if found == true {
                    foundVTableOffset = Int(otherVTableOffset) - vtableloc
                    break
                }
            }
            
            if foundVTableOffset != vtableDataLength {
                cursor -= vtableDataLength
            } else {
                vTableOffsets.append(Int32(cursor))
            }
        }
        
        let indexLocation = cursor - vtableloc
        
        put(Int32(foundVTableOffset), at: indexLocation)
        
        objectStart = -1
        
        return Offset(vtableloc)
    }
    
    public func startVector(count : Int) throws{
        guard objectStart == -1 && vectorNumElems == -1 else {
            throw FlatBufferBuilderError.ObjectIsNotClosed
        }
        vectorNumElems = Int32(count)
    }
    
    public func endVector() -> Offset {
        put(vectorNumElems)
        vectorNumElems = -1
        return Int32(cursor)
    }
    
    private var stringCache : [String:Offset] = [:]
    public func createString(value : String?) throws -> Offset {
        guard objectStart == -1 && vectorNumElems == -1 else {
            throw FlatBufferBuilderError.ObjectIsNotClosed
        }
        guard let value = value else {
            return 0
        }
        
        if config.uniqueStrings{
            if let o = stringCache[value]{
                return o
            }
        }
        
        let length = value.utf8.count
        
        increaseCapacity(length)
        
        let p = UnsafeMutablePointer<UInt8>(_data.advancedBy(leftCursor-length))
        var charofs = 0
        for c in value.utf8
        {
            assert(charofs < length)
            p.advancedBy(charofs).memory = c
            charofs = charofs + 1
        }
        
        cursor += length
        
        put(Int32(length))
        
        let o = Offset(cursor)
        if config.uniqueStrings {
            stringCache[value] = o
        }
        return o
    }
    
    public func createString(value : UnsafeBufferPointer<UInt8>?) throws -> Offset {
        guard objectStart == -1 && vectorNumElems == -1 else {
            throw FlatBufferBuilderError.ObjectIsNotClosed
        }
        guard let value = value else {
            return 0
        }
        let length = value.count
        increaseCapacity(length)
        _data.advancedBy(leftCursor-length).assignFrom(UnsafeMutablePointer(value.baseAddress), count: length)
        cursor += length
        put(Int32(length))
        return Offset(cursor)
    }
    
    public func createStaticString(value : StaticString?) throws -> Offset {
        guard objectStart == -1 && vectorNumElems == -1 else {
            throw FlatBufferBuilderError.ObjectIsNotClosed
        }
        guard let value = value else {
            return 0
        }
        
        let buf = value.utf8Start
        let length = value.byteSize
        
        increaseCapacity(length)
        _data.advancedBy(leftCursor-length).assignFrom(UnsafeMutablePointer<UInt8>(buf), count: length)
        cursor += length
        
        put(Int32(length))
        return Offset(cursor)
    }
    
    public func finish(offset : Offset, fileIdentifier : String?) throws -> Void {
        guard offset <= Int32(cursor) else {
            throw FlatBufferBuilderError.OffsetIsTooBig
        }
        guard objectStart == -1 && vectorNumElems == -1 else {
            throw FlatBufferBuilderError.ObjectIsNotClosed
        }
        var prefixLength = 4
        increaseCapacity(8)
        if let fileIdentifier = fileIdentifier {
            let buf = fileIdentifier.utf8
            guard buf.count == 4 else {
                throw FlatBufferBuilderError.BadFileIdentifier
            }
            
            _data.advancedBy(leftCursor-4).initializeFrom(buf)
            prefixLength += 4
        }
        
        var v = (Int32(cursor + prefixLength) - offset).littleEndian
        let c = strideofValue(v)
        withUnsafePointer(&v){
            _data.advancedBy(leftCursor - prefixLength).assignFrom(UnsafeMutablePointer<UInt8>($0), count: c)
        }
        cursor += prefixLength
    }
}

// Pooling
public extension FlatBufferBuilder {
    
    public func reset ()
    {
        cursor = 0
        objectStart = -1
        vectorNumElems = -1;
        vTableOffsets.removeAll(keepCapacity: true)
        currentVTable.removeAll(keepCapacity: true)
        cache.removeAll(keepCapacity: true)
        inProgress.removeAll(keepCapacity: true)
        deferedBindings.removeAll(keepCapacity: true)
        stringCache.removeAll(keepCapacity: true)
    }
    
    public static func create(config: BinaryBuildConfig) -> FlatBufferBuilder {
        objc_sync_enter(instancePool)
        defer { objc_sync_exit(instancePool) }
        
        if (instancePool.count > 0)
        {
            let builder = instancePool.removeLast()
            builder.config = config
            if (config.initialCapacity > builder.capacity) {
                builder._data.dealloc(builder.capacity)
                builder.capacity = config.initialCapacity
                builder._data = UnsafeMutablePointer.alloc(builder.capacity)
            }
            return builder
        }
        
        return FlatBufferBuilder(config: config)
    }
    
    public static func reuse(builder : FlatBufferBuilder) {
        objc_sync_enter(instancePool)
        defer { objc_sync_exit(instancePool) }
        
        if (UInt(instancePool.count) < maxInstanceCacheSize)
        {
            builder.reset()
            instancePool.append(builder)
        }
    }
    
}
