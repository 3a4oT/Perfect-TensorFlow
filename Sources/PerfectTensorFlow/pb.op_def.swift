// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tensorflow/core/framework/op_def.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Defines an operation. A NodeDef in a GraphDef specifies an Op by
/// using the "op" field which should match the name of a OpDef.
public struct Tensorflow_OpDef: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".OpDef"

  /// Op names starting with an underscore are reserved for internal use.
  /// Names should be CamelCase and match the regexp "[A-Z][a-zA-Z0-9_]*".
  var name: String {
    get {return _storage._name}
    set {_uniqueStorage()._name = newValue}
  }

  /// Description of the input(s).
  var inputArg: [Tensorflow_OpDef.ArgDef] {
    get {return _storage._inputArg}
    set {_uniqueStorage()._inputArg = newValue}
  }

  /// Description of the output(s).
  var outputArg: [Tensorflow_OpDef.ArgDef] {
    get {return _storage._outputArg}
    set {_uniqueStorage()._outputArg = newValue}
  }

  var attr: [Tensorflow_OpDef.AttrDef] {
    get {return _storage._attr}
    set {_uniqueStorage()._attr = newValue}
  }

  /// Optional deprecation based on GraphDef versions.
  var deprecation: Tensorflow_OpDeprecation {
    get {return _storage._deprecation ?? Tensorflow_OpDeprecation()}
    set {_uniqueStorage()._deprecation = newValue}
  }
  /// Returns true if `deprecation` has been explicitly set.
  var hasDeprecation: Bool {return _storage._deprecation != nil}
  /// Clears the value of `deprecation`. Subsequent reads from it will return its default value.
  mutating func clearDeprecation() {_storage._deprecation = nil}

  /// One-line human-readable description of what the Op does.
  var summary: String {
    get {return _storage._summary}
    set {_uniqueStorage()._summary = newValue}
  }

  /// Additional, longer human-readable description of what the Op does.
  var description_p: String {
    get {return _storage._description_p}
    set {_uniqueStorage()._description_p = newValue}
  }

  /// True if the operation is commutative ("op(a,b) == op(b,a)" for all inputs)
  var isCommutative: Bool {
    get {return _storage._isCommutative}
    set {_uniqueStorage()._isCommutative = newValue}
  }

  /// If is_aggregate is true, then this operation accepts N >= 2
  /// inputs and produces 1 output all of the same type.  Should be
  /// associative and commutative, and produce output with the same
  /// shape as the input.  The optimizer may replace an aggregate op
  /// taking input from multiple devices with a tree of aggregate ops
  /// that aggregate locally within each device (and possibly within
  /// groups of nearby devices) before communicating.
  /// TODO(josh11b): Implement that optimization.
  var isAggregate: Bool {
    get {return _storage._isAggregate}
    set {_uniqueStorage()._isAggregate = newValue}
  }

  /// By default Ops may be moved between devices.  Stateful ops should
  /// either not be moved, or should only be moved if that state can also
  /// be moved (e.g. via some sort of save / restore).
  /// Stateful ops are guaranteed to never be optimized away by Common
  /// Subexpression Elimination (CSE).
  var isStateful: Bool {
    get {return _storage._isStateful}
    set {_uniqueStorage()._isStateful = newValue}
  }

  /// By default, all inputs to an Op must be initialized Tensors.  Ops
  /// that may initialize tensors for the first time should set this
  /// field to true, to allow the Op to take an uninitialized Tensor as
  /// input.
  var allowsUninitializedInput: Bool {
    get {return _storage._allowsUninitializedInput}
    set {_uniqueStorage()._allowsUninitializedInput = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// For describing inputs and outputs.
  struct ArgDef: SwiftProtobuf.Message {
    public static let protoMessageName: String = Tensorflow_OpDef.protoMessageName + ".ArgDef"

    /// Name for the input/output.  Should match the regexp "[a-z][a-z0-9_]*".
    var name: String = String()

    /// Human readable description.
    var description_p: String = String()

    /// Describes the type of one or more tensors that are accepted/produced
    /// by this input/output arg.  The only legal combinations are:
    /// * For a single tensor: either the "type" field is set or the
    ///   "type_attr" field is set to the name of an attr with type "type".
    /// * For a sequence of tensors with the same type: the "number_attr"
    ///   field will be set to the name of an attr with type "int", and
    ///   either the "type" or "type_attr" field will be set as for
    ///   single tensors.
    /// * For a sequence of tensors, the "type_list_attr" field will be set
    ///   to the name of an attr with type "list(type)".
    var type: Tensorflow_DataType = .dtInvalid

    /// if specified, attr must have type "type"
    var typeAttr: String = String()

    /// if specified, attr must have type "int"
    var numberAttr: String = String()

    /// If specified, attr must have type "list(type)", and none of
    /// type, type_attr, and number_attr may be specified.
    var typeListAttr: String = String()

    /// For inputs: if true, the inputs are required to be refs.
    ///   By default, inputs can be either refs or non-refs.
    /// For outputs: if true, outputs are refs, otherwise they are not.
    var isRef: Bool = false

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}

    /// Used by the decoding initializers in the SwiftProtobuf library, not generally
    /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
    /// initializers are defined in the SwiftProtobuf library. See the Message and
    /// Message+*Additions` files.
    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &self.name)
        case 2: try decoder.decodeSingularStringField(value: &self.description_p)
        case 3: try decoder.decodeSingularEnumField(value: &self.type)
        case 4: try decoder.decodeSingularStringField(value: &self.typeAttr)
        case 5: try decoder.decodeSingularStringField(value: &self.numberAttr)
        case 6: try decoder.decodeSingularStringField(value: &self.typeListAttr)
        case 16: try decoder.decodeSingularBoolField(value: &self.isRef)
        default: break
        }
      }
    }

    /// Used by the encoding methods of the SwiftProtobuf library, not generally
    /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
    /// other serializer methods are defined in the SwiftProtobuf library. See the
    /// `Message` and `Message+*Additions` files.
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
      if !self.name.isEmpty {
        try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
      }
      if !self.description_p.isEmpty {
        try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
      }
      if self.type != .dtInvalid {
        try visitor.visitSingularEnumField(value: self.type, fieldNumber: 3)
      }
      if !self.typeAttr.isEmpty {
        try visitor.visitSingularStringField(value: self.typeAttr, fieldNumber: 4)
      }
      if !self.numberAttr.isEmpty {
        try visitor.visitSingularStringField(value: self.numberAttr, fieldNumber: 5)
      }
      if !self.typeListAttr.isEmpty {
        try visitor.visitSingularStringField(value: self.typeListAttr, fieldNumber: 6)
      }
      if self.isRef != false {
        try visitor.visitSingularBoolField(value: self.isRef, fieldNumber: 16)
      }
      try unknownFields.traverse(visitor: &visitor)
    }
  }

  /// Description of the graph-construction-time configuration of this
  /// Op.  That is to say, this describes the attr fields that will
  /// be specified in the NodeDef.
  struct AttrDef: SwiftProtobuf.Message {
    public static let protoMessageName: String = Tensorflow_OpDef.protoMessageName + ".AttrDef"

    /// A descriptive name for the argument.  May be used, e.g. by the
    /// Python client, as a keyword argument name, and so should match
    /// the regexp "[a-z][a-z0-9_]+".
    var name: String {
      get {return _storage._name}
      set {_uniqueStorage()._name = newValue}
    }

    /// One of the type names from attr_value.proto ("string", "list(string)",
    /// "int", etc.).
    var type: String {
      get {return _storage._type}
      set {_uniqueStorage()._type = newValue}
    }

    /// A reasonable default for this attribute if the user does not supply
    /// a value.  If not specified, the user must supply a value.
    var defaultValue: Tensorflow_AttrValue {
      get {return _storage._defaultValue ?? Tensorflow_AttrValue()}
      set {_uniqueStorage()._defaultValue = newValue}
    }
    /// Returns true if `defaultValue` has been explicitly set.
    var hasDefaultValue: Bool {return _storage._defaultValue != nil}
    /// Clears the value of `defaultValue`. Subsequent reads from it will return its default value.
    mutating func clearDefaultValue() {_storage._defaultValue = nil}

    /// Human-readable description.
    var description_p: String {
      get {return _storage._description_p}
      set {_uniqueStorage()._description_p = newValue}
    }

    /// For type == "int", this is a minimum value.  For "list(___)"
    /// types, this is the minimum length.
    var hasMinimum_p: Bool {
      get {return _storage._hasMinimum_p}
      set {_uniqueStorage()._hasMinimum_p = newValue}
    }

    var minimum: Int64 {
      get {return _storage._minimum}
      set {_uniqueStorage()._minimum = newValue}
    }

    /// The set of allowed values.  Has type that is the "list" version
    /// of the "type" field above (uses the "list" field of AttrValue).
    /// If type == "type" or "list(type)" above, then the "type" field
    /// of "allowed_values.list" has the set of allowed DataTypes.
    /// If type == "string" or "list(string)", then the "s" field of
    /// "allowed_values.list" has the set of allowed strings.
    var allowedValues: Tensorflow_AttrValue {
      get {return _storage._allowedValues ?? Tensorflow_AttrValue()}
      set {_uniqueStorage()._allowedValues = newValue}
    }
    /// Returns true if `allowedValues` has been explicitly set.
    var hasAllowedValues: Bool {return _storage._allowedValues != nil}
    /// Clears the value of `allowedValues`. Subsequent reads from it will return its default value.
    mutating func clearAllowedValues() {_storage._allowedValues = nil}

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}

    /// Used by the decoding initializers in the SwiftProtobuf library, not generally
    /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
    /// initializers are defined in the SwiftProtobuf library. See the Message and
    /// Message+*Additions` files.
    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
      _ = _uniqueStorage()
      try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
        while let fieldNumber = try decoder.nextFieldNumber() {
          switch fieldNumber {
          case 1: try decoder.decodeSingularStringField(value: &_storage._name)
          case 2: try decoder.decodeSingularStringField(value: &_storage._type)
          case 3: try decoder.decodeSingularMessageField(value: &_storage._defaultValue)
          case 4: try decoder.decodeSingularStringField(value: &_storage._description_p)
          case 5: try decoder.decodeSingularBoolField(value: &_storage._hasMinimum_p)
          case 6: try decoder.decodeSingularInt64Field(value: &_storage._minimum)
          case 7: try decoder.decodeSingularMessageField(value: &_storage._allowedValues)
          default: break
          }
        }
      }
    }

    /// Used by the encoding methods of the SwiftProtobuf library, not generally
    /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
    /// other serializer methods are defined in the SwiftProtobuf library. See the
    /// `Message` and `Message+*Additions` files.
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
      try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
        if !_storage._name.isEmpty {
          try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 1)
        }
        if !_storage._type.isEmpty {
          try visitor.visitSingularStringField(value: _storage._type, fieldNumber: 2)
        }
        if let v = _storage._defaultValue {
          try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
        }
        if !_storage._description_p.isEmpty {
          try visitor.visitSingularStringField(value: _storage._description_p, fieldNumber: 4)
        }
        if _storage._hasMinimum_p != false {
          try visitor.visitSingularBoolField(value: _storage._hasMinimum_p, fieldNumber: 5)
        }
        if _storage._minimum != 0 {
          try visitor.visitSingularInt64Field(value: _storage._minimum, fieldNumber: 6)
        }
        if let v = _storage._allowedValues {
          try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
        }
      }
      try unknownFields.traverse(visitor: &visitor)
    }

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._name)
        case 2: try decoder.decodeRepeatedMessageField(value: &_storage._inputArg)
        case 3: try decoder.decodeRepeatedMessageField(value: &_storage._outputArg)
        case 4: try decoder.decodeRepeatedMessageField(value: &_storage._attr)
        case 5: try decoder.decodeSingularStringField(value: &_storage._summary)
        case 6: try decoder.decodeSingularStringField(value: &_storage._description_p)
        case 8: try decoder.decodeSingularMessageField(value: &_storage._deprecation)
        case 16: try decoder.decodeSingularBoolField(value: &_storage._isAggregate)
        case 17: try decoder.decodeSingularBoolField(value: &_storage._isStateful)
        case 18: try decoder.decodeSingularBoolField(value: &_storage._isCommutative)
        case 19: try decoder.decodeSingularBoolField(value: &_storage._allowsUninitializedInput)
        default: break
        }
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._name.isEmpty {
        try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 1)
      }
      if !_storage._inputArg.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._inputArg, fieldNumber: 2)
      }
      if !_storage._outputArg.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._outputArg, fieldNumber: 3)
      }
      if !_storage._attr.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._attr, fieldNumber: 4)
      }
      if !_storage._summary.isEmpty {
        try visitor.visitSingularStringField(value: _storage._summary, fieldNumber: 5)
      }
      if !_storage._description_p.isEmpty {
        try visitor.visitSingularStringField(value: _storage._description_p, fieldNumber: 6)
      }
      if let v = _storage._deprecation {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
      }
      if _storage._isAggregate != false {
        try visitor.visitSingularBoolField(value: _storage._isAggregate, fieldNumber: 16)
      }
      if _storage._isStateful != false {
        try visitor.visitSingularBoolField(value: _storage._isStateful, fieldNumber: 17)
      }
      if _storage._isCommutative != false {
        try visitor.visitSingularBoolField(value: _storage._isCommutative, fieldNumber: 18)
      }
      if _storage._allowsUninitializedInput != false {
        try visitor.visitSingularBoolField(value: _storage._allowsUninitializedInput, fieldNumber: 19)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Information about version-dependent deprecation of an op
public struct Tensorflow_OpDeprecation: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".OpDeprecation"

  /// First GraphDef version at which the op is disallowed.
  var version: Int32 = 0

  /// Explanation of why it was deprecated and what to use instead.
  var explanation: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.version)
      case 2: try decoder.decodeSingularStringField(value: &self.explanation)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.version != 0 {
      try visitor.visitSingularInt32Field(value: self.version, fieldNumber: 1)
    }
    if !self.explanation.isEmpty {
      try visitor.visitSingularStringField(value: self.explanation, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

/// A collection of OpDefs
public struct Tensorflow_OpList: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".OpList"

  var op: [Tensorflow_OpDef] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.op)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.op.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.op, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "tensorflow"

extension Tensorflow_OpDef: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .standard(proto: "input_arg"),
    3: .standard(proto: "output_arg"),
    4: .same(proto: "attr"),
    8: .same(proto: "deprecation"),
    5: .same(proto: "summary"),
    6: .same(proto: "description"),
    18: .standard(proto: "is_commutative"),
    16: .standard(proto: "is_aggregate"),
    17: .standard(proto: "is_stateful"),
    19: .standard(proto: "allows_uninitialized_input"),
  ]

  fileprivate class _StorageClass {
    var _name: String = String()
    var _inputArg: [Tensorflow_OpDef.ArgDef] = []
    var _outputArg: [Tensorflow_OpDef.ArgDef] = []
    var _attr: [Tensorflow_OpDef.AttrDef] = []
    var _deprecation: Tensorflow_OpDeprecation? = nil
    var _summary: String = String()
    var _description_p: String = String()
    var _isCommutative: Bool = false
    var _isAggregate: Bool = false
    var _isStateful: Bool = false
    var _allowsUninitializedInput: Bool = false

    static let defaultInstance = _StorageClass()

    public init() {}

    init(copying source: _StorageClass) {
      _name = source._name
      _inputArg = source._inputArg
      _outputArg = source._outputArg
      _attr = source._attr
      _deprecation = source._deprecation
      _summary = source._summary
      _description_p = source._description_p
      _isCommutative = source._isCommutative
      _isAggregate = source._isAggregate
      _isStateful = source._isStateful
      _allowsUninitializedInput = source._allowsUninitializedInput
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Tensorflow_OpDef) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_storage, other_storage) in
        if _storage._name != other_storage._name {return false}
        if _storage._inputArg != other_storage._inputArg {return false}
        if _storage._outputArg != other_storage._outputArg {return false}
        if _storage._attr != other_storage._attr {return false}
        if _storage._deprecation != other_storage._deprecation {return false}
        if _storage._summary != other_storage._summary {return false}
        if _storage._description_p != other_storage._description_p {return false}
        if _storage._isCommutative != other_storage._isCommutative {return false}
        if _storage._isAggregate != other_storage._isAggregate {return false}
        if _storage._isStateful != other_storage._isStateful {return false}
        if _storage._allowsUninitializedInput != other_storage._allowsUninitializedInput {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Tensorflow_OpDef.ArgDef: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "description"),
    3: .same(proto: "type"),
    4: .standard(proto: "type_attr"),
    5: .standard(proto: "number_attr"),
    6: .standard(proto: "type_list_attr"),
    16: .standard(proto: "is_ref"),
  ]

  public func _protobuf_generated_isEqualTo(other: Tensorflow_OpDef.ArgDef) -> Bool {
    if self.name != other.name {return false}
    if self.description_p != other.description_p {return false}
    if self.type != other.type {return false}
    if self.typeAttr != other.typeAttr {return false}
    if self.numberAttr != other.numberAttr {return false}
    if self.typeListAttr != other.typeListAttr {return false}
    if self.isRef != other.isRef {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Tensorflow_OpDef.AttrDef: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "type"),
    3: .standard(proto: "default_value"),
    4: .same(proto: "description"),
    5: .standard(proto: "has_minimum"),
    6: .same(proto: "minimum"),
    7: .standard(proto: "allowed_values"),
  ]

  fileprivate class _StorageClass {
    var _name: String = String()
    var _type: String = String()
    var _defaultValue: Tensorflow_AttrValue? = nil
    var _description_p: String = String()
    var _hasMinimum_p: Bool = false
    var _minimum: Int64 = 0
    var _allowedValues: Tensorflow_AttrValue? = nil

    static let defaultInstance = _StorageClass()

    public init() {}

    init(copying source: _StorageClass) {
      _name = source._name
      _type = source._type
      _defaultValue = source._defaultValue
      _description_p = source._description_p
      _hasMinimum_p = source._hasMinimum_p
      _minimum = source._minimum
      _allowedValues = source._allowedValues
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Tensorflow_OpDef.AttrDef) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_storage, other_storage) in
        if _storage._name != other_storage._name {return false}
        if _storage._type != other_storage._type {return false}
        if _storage._defaultValue != other_storage._defaultValue {return false}
        if _storage._description_p != other_storage._description_p {return false}
        if _storage._hasMinimum_p != other_storage._hasMinimum_p {return false}
        if _storage._minimum != other_storage._minimum {return false}
        if _storage._allowedValues != other_storage._allowedValues {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Tensorflow_OpDeprecation: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "version"),
    2: .same(proto: "explanation"),
  ]

  public func _protobuf_generated_isEqualTo(other: Tensorflow_OpDeprecation) -> Bool {
    if self.version != other.version {return false}
    if self.explanation != other.explanation {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Tensorflow_OpList: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "op"),
  ]

  public func _protobuf_generated_isEqualTo(other: Tensorflow_OpList) -> Bool {
    if self.op != other.op {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
