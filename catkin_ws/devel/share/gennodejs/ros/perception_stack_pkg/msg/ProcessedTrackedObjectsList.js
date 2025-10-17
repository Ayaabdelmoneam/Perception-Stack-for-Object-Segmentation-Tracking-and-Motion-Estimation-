// Auto-generated. Do not edit!

// (in-package perception_stack_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ProcessedTrackedObject = require('./ProcessedTrackedObject.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ProcessedTrackedObjectsList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.ProcessedTrackedObjectList = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('ProcessedTrackedObjectList')) {
        this.ProcessedTrackedObjectList = initObj.ProcessedTrackedObjectList
      }
      else {
        this.ProcessedTrackedObjectList = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ProcessedTrackedObjectsList
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [ProcessedTrackedObjectList]
    // Serialize the length for message field [ProcessedTrackedObjectList]
    bufferOffset = _serializer.uint32(obj.ProcessedTrackedObjectList.length, buffer, bufferOffset);
    obj.ProcessedTrackedObjectList.forEach((val) => {
      bufferOffset = ProcessedTrackedObject.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ProcessedTrackedObjectsList
    let len;
    let data = new ProcessedTrackedObjectsList(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [ProcessedTrackedObjectList]
    // Deserialize array length for message field [ProcessedTrackedObjectList]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ProcessedTrackedObjectList = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ProcessedTrackedObjectList[i] = ProcessedTrackedObject.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.ProcessedTrackedObjectList.forEach((val) => {
      length += ProcessedTrackedObject.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'perception_stack_pkg/ProcessedTrackedObjectsList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2c69238cbf3173dcaafbf881b5430573';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    ProcessedTrackedObject[] ProcessedTrackedObjectList
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: perception_stack_pkg/ProcessedTrackedObject
    int32 id
    string class_name
    float32 speed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ProcessedTrackedObjectsList(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.ProcessedTrackedObjectList !== undefined) {
      resolved.ProcessedTrackedObjectList = new Array(msg.ProcessedTrackedObjectList.length);
      for (let i = 0; i < resolved.ProcessedTrackedObjectList.length; ++i) {
        resolved.ProcessedTrackedObjectList[i] = ProcessedTrackedObject.Resolve(msg.ProcessedTrackedObjectList[i]);
      }
    }
    else {
      resolved.ProcessedTrackedObjectList = []
    }

    return resolved;
    }
};

module.exports = ProcessedTrackedObjectsList;
