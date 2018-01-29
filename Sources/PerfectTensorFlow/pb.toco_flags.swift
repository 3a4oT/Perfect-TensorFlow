// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tensorflow/contrib/lite/toco/toco_flags.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

/// Copyright 2017 The TensorFlow Authors. All Rights Reserved.
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.

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

/// Supported I/O file formats. Some formats may be input-only or output-only.
public enum Toco_FileFormat: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case unknown // = 0

  /// GraphDef, third_party/tensorflow/core/framework/graph.proto
  case tensorflowGraphdef // = 1

  /// Tensorflow's mobile inference model.
  /// third_party/tensorflow/contrib/tflite/schema.fbs
  case tflite // = 2

  /// GraphViz
  /// Export-only.
  case graphvizDot // = 3

  public init() {
    self = .unknown
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unknown
    case 1: self = .tensorflowGraphdef
    case 2: self = .tflite
    case 3: self = .graphvizDot
    default: return nil
    }
  }

  public var rawValue: Int {
    switch self {
    case .unknown: return 0
    case .tensorflowGraphdef: return 1
    case .tflite: return 2
    case .graphvizDot: return 3
    }
  }

}

/// TocoFlags encodes extra parameters that drive tooling operations, that
/// are not normally encoded in model files and in general may not be thought
/// of as properties of models, instead describing how models are to be
/// processed in the context of the present tooling job.
/// Next Id: 13
public struct Toco_TocoFlags: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".TocoFlags"

  /// Input file format
  public var inputFormat: Toco_FileFormat {
    get {return _inputFormat ?? .unknown}
    set {_inputFormat = newValue}
  }
  /// Returns true if `inputFormat` has been explicitly set.
  public var hasInputFormat: Bool {return self._inputFormat != nil}
  /// Clears the value of `inputFormat`. Subsequent reads from it will return its default value.
  public mutating func clearInputFormat() {self._inputFormat = nil}

  /// Output file format
  public var outputFormat: Toco_FileFormat {
    get {return _outputFormat ?? .unknown}
    set {_outputFormat = newValue}
  }
  /// Returns true if `outputFormat` has been explicitly set.
  public var hasOutputFormat: Bool {return self._outputFormat != nil}
  /// Clears the value of `outputFormat`. Subsequent reads from it will return its default value.
  public mutating func clearOutputFormat() {self._outputFormat = nil}

  /// Similar to inference_type, but allows to control specifically the
  /// quantization of input arrays, separately from other arrays.
  ///
  /// If not set, then the value of inference_type is implicitly used, i.e.
  /// by default input arrays are quantized like other arrays.
  ///
  /// Like inference_type, this only affects real-number arrays. By "real-number"
  /// we mean float arrays, and quantized arrays. This excludes plain
  /// integer arrays, strings arrays, and every other data type.
  ///
  /// The typical use for this flag is for vision models taking a bitmap
  /// as input, typically with uint8 channels, yet still requiring floating-point
  /// inference. For such image models, the uint8 input is quantized, i.e.
  /// the uint8 values are interpreted as real numbers, and the quantization
  /// parameters used for such input arrays are their mean_value, std_value
  /// parameters.
  public var inferenceInputType: Tensorflow_DataType {
    get {return _inferenceInputType ?? .dtInvalid}
    set {_inferenceInputType = newValue}
  }
  /// Returns true if `inferenceInputType` has been explicitly set.
  public var hasInferenceInputType: Bool {return self._inferenceInputType != nil}
  /// Clears the value of `inferenceInputType`. Subsequent reads from it will return its default value.
  public mutating func clearInferenceInputType() {self._inferenceInputType = nil}

  /// Sets the type of real-number arrays in the output file, that is, controls
  /// the representation (quantization) of real numbers in the output file,
  /// except for input arrays, which are controlled by inference_input_type.
  ///
  /// NOTE: this flag only impacts real-number arrays. By "real-number"
  /// we mean float arrays, and quantized arrays. This excludes plain
  /// integer arrays, strings arrays, and every other data type.
  ///
  /// For real-number arrays, the impact of this flag is to allow the output
  /// file to choose a different real-numbers representation (quantization)
  /// from what the input file used. For any other types of arrays, changing
  /// the data type would not make sense.
  ///
  /// Specifically:
  ///    - If FLOAT, then real-numbers arrays will be of type float in
  ///      the output file. If they were quantized in the input file, then
  ///      they get dequantized.
  ///    - If QUANTIZED_UINT8, then real-numbers arrays will be quantized
  ///      as uint8 in the output file. If they were float in the input file,
  ///      then they get quantized.
  ///    - If not set, then all real-numbers arrays retain the same type in the
  ///      output file as they have in the input file.
  public var inferenceType: Tensorflow_DataType {
    get {return _inferenceType ?? .dtInvalid}
    set {_inferenceType = newValue}
  }
  /// Returns true if `inferenceType` has been explicitly set.
  public var hasInferenceType: Bool {return self._inferenceType != nil}
  /// Clears the value of `inferenceType`. Subsequent reads from it will return its default value.
  public mutating func clearInferenceType() {self._inferenceType = nil}

  /// default_ranges_min and default_ranges_max are helpers to experiment
  /// with quantization of models. Normally, quantization requires the input
  /// model to have (min, max) range information for every activations array.
  /// This is needed in order to know how to quantize arrays and still achieve
  /// satisfactory accuracy. However, in some circumstances one would just like
  /// to estimate the performance of quantized inference, without caring about
  /// accuracy. That is what default_ranges_min and default_ranges_max are for:
  /// when specified, they will be used as default (min, max) range boundaries
  /// for all activation arrays that lack (min, max) range information, thus
  /// allowing for quantization to proceed.
  ///
  /// It should be clear from the above explanation that these parameters are
  /// for experimentation purposes only and should not be used in production:
  /// they make it easy to quantize models, but the resulting quantized model
  /// will be inaccurate.
  public var defaultRangesMin: Float {
    get {return _defaultRangesMin ?? 0}
    set {_defaultRangesMin = newValue}
  }
  /// Returns true if `defaultRangesMin` has been explicitly set.
  public var hasDefaultRangesMin: Bool {return self._defaultRangesMin != nil}
  /// Clears the value of `defaultRangesMin`. Subsequent reads from it will return its default value.
  public mutating func clearDefaultRangesMin() {self._defaultRangesMin = nil}

  public var defaultRangesMax: Float {
    get {return _defaultRangesMax ?? 0}
    set {_defaultRangesMax = newValue}
  }
  /// Returns true if `defaultRangesMax` has been explicitly set.
  public var hasDefaultRangesMax: Bool {return self._defaultRangesMax != nil}
  /// Clears the value of `defaultRangesMax`. Subsequent reads from it will return its default value.
  public mutating func clearDefaultRangesMax() {self._defaultRangesMax = nil}

  /// Ignore and discard FakeQuant nodes. For instance, that can be used to
  /// generate plain float code without fake-quantization from a quantized
  /// graph.
  public var dropFakeQuant: Bool {
    get {return _dropFakeQuant ?? false}
    set {_dropFakeQuant = newValue}
  }
  /// Returns true if `dropFakeQuant` has been explicitly set.
  public var hasDropFakeQuant: Bool {return self._dropFakeQuant != nil}
  /// Clears the value of `dropFakeQuant`. Subsequent reads from it will return its default value.
  public mutating func clearDropFakeQuant() {self._dropFakeQuant = nil}

  /// Normally, FakeQuant nodes must be strict boundaries for graph
  /// transformations, in order to ensure that quantized inference has the
  /// exact same arithmetic behavior as quantized training --- which is the
  /// whole point of quantized training and of FakeQuant nodes in the first
  /// place. However, that entails subtle requirements on where exactly
  /// FakeQuant nodes must be placed in the graph. Some quantized graphs
  /// have FakeQuant nodes at unexpected locations, that prevent graph
  /// transformations that are necessary in order to generate inference
  /// code for these graphs. Such graphs should be fixed, but as a
  /// temporary work-around, setting this reorder_across_fake_quant flag
  /// allows toco to perform necessary graph transformaitons on them,
  /// at the cost of no longer faithfully matching inference and training
  /// arithmetic.
  public var reorderAcrossFakeQuant: Bool {
    get {return _reorderAcrossFakeQuant ?? false}
    set {_reorderAcrossFakeQuant = newValue}
  }
  /// Returns true if `reorderAcrossFakeQuant` has been explicitly set.
  public var hasReorderAcrossFakeQuant: Bool {return self._reorderAcrossFakeQuant != nil}
  /// Clears the value of `reorderAcrossFakeQuant`. Subsequent reads from it will return its default value.
  public mutating func clearReorderAcrossFakeQuant() {self._reorderAcrossFakeQuant = nil}

  /// If true, allow TOCO to create TF Lite Custom operators for all the
  /// unsupported Tensorflow ops.
  public var allowCustomOps: Bool {
    get {return _allowCustomOps ?? false}
    set {_allowCustomOps = newValue}
  }
  /// Returns true if `allowCustomOps` has been explicitly set.
  public var hasAllowCustomOps: Bool {return self._allowCustomOps != nil}
  /// Clears the value of `allowCustomOps`. Subsequent reads from it will return its default value.
  public mutating func clearAllowCustomOps() {self._allowCustomOps = nil}

  /// Applies only to the case when the input format is TENSORFLOW_GRAPHDEF.
  /// If true, then control dependencies will be immediately dropped during
  /// import.
  /// If not set, the default behavior is as follows:
  ///    - Default to false if the output format is TENSORFLOW_GRAPHDEF.
  ///    - Default to true in all other cases.
  public var dropControlDependency: Bool {
    get {return _dropControlDependency ?? false}
    set {_dropControlDependency = newValue}
  }
  /// Returns true if `dropControlDependency` has been explicitly set.
  public var hasDropControlDependency: Bool {return self._dropControlDependency != nil}
  /// Clears the value of `dropControlDependency`. Subsequent reads from it will return its default value.
  public mutating func clearDropControlDependency() {self._dropControlDependency = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self._inputFormat)
      case 2: try decoder.decodeSingularEnumField(value: &self._outputFormat)
      case 4: try decoder.decodeSingularEnumField(value: &self._inferenceType)
      case 5: try decoder.decodeSingularFloatField(value: &self._defaultRangesMin)
      case 6: try decoder.decodeSingularFloatField(value: &self._defaultRangesMax)
      case 7: try decoder.decodeSingularBoolField(value: &self._dropFakeQuant)
      case 8: try decoder.decodeSingularBoolField(value: &self._reorderAcrossFakeQuant)
      case 10: try decoder.decodeSingularBoolField(value: &self._allowCustomOps)
      case 11: try decoder.decodeSingularEnumField(value: &self._inferenceInputType)
      case 12: try decoder.decodeSingularBoolField(value: &self._dropControlDependency)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._inputFormat {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 1)
    }
    if let v = self._outputFormat {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 2)
    }
    if let v = self._inferenceType {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 4)
    }
    if let v = self._defaultRangesMin {
      try visitor.visitSingularFloatField(value: v, fieldNumber: 5)
    }
    if let v = self._defaultRangesMax {
      try visitor.visitSingularFloatField(value: v, fieldNumber: 6)
    }
    if let v = self._dropFakeQuant {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 7)
    }
    if let v = self._reorderAcrossFakeQuant {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 8)
    }
    if let v = self._allowCustomOps {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 10)
    }
    if let v = self._inferenceInputType {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 11)
    }
    if let v = self._dropControlDependency {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 12)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _inputFormat: Toco_FileFormat? = nil
  fileprivate var _outputFormat: Toco_FileFormat? = nil
  fileprivate var _inferenceInputType: Tensorflow_DataType? = nil
  fileprivate var _inferenceType: Tensorflow_DataType? = nil
  fileprivate var _defaultRangesMin: Float? = nil
  fileprivate var _defaultRangesMax: Float? = nil
  fileprivate var _dropFakeQuant: Bool? = nil
  fileprivate var _reorderAcrossFakeQuant: Bool? = nil
  fileprivate var _allowCustomOps: Bool? = nil
  fileprivate var _dropControlDependency: Bool? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "toco"

extension Toco_FileFormat: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "FILE_FORMAT_UNKNOWN"),
    1: .same(proto: "TENSORFLOW_GRAPHDEF"),
    2: .same(proto: "TFLITE"),
    3: .same(proto: "GRAPHVIZ_DOT"),
  ]
}

extension Toco_TocoFlags: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "input_format"),
    2: .standard(proto: "output_format"),
    11: .standard(proto: "inference_input_type"),
    4: .standard(proto: "inference_type"),
    5: .standard(proto: "default_ranges_min"),
    6: .standard(proto: "default_ranges_max"),
    7: .standard(proto: "drop_fake_quant"),
    8: .standard(proto: "reorder_across_fake_quant"),
    10: .standard(proto: "allow_custom_ops"),
    12: .standard(proto: "drop_control_dependency"),
  ]

  public func _protobuf_generated_isEqualTo(other: Toco_TocoFlags) -> Bool {
    if self._inputFormat != other._inputFormat {return false}
    if self._outputFormat != other._outputFormat {return false}
    if self._inferenceInputType != other._inferenceInputType {return false}
    if self._inferenceType != other._inferenceType {return false}
    if self._defaultRangesMin != other._defaultRangesMin {return false}
    if self._defaultRangesMax != other._defaultRangesMax {return false}
    if self._dropFakeQuant != other._dropFakeQuant {return false}
    if self._reorderAcrossFakeQuant != other._reorderAcrossFakeQuant {return false}
    if self._allowCustomOps != other._allowCustomOps {return false}
    if self._dropControlDependency != other._dropControlDependency {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}