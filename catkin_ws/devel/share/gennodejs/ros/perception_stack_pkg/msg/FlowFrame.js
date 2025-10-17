// Auto-generated. Do not edit!

// (in-package perception_stack_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FlowFrame {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.height = null;
      this.width = null;
      this.flow_x = null;
      this.flow_y = null;
      this.dt = null;
      this.scale_factor = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('flow_x')) {
        this.flow_x = initObj.flow_x
      }
      else {
        this.flow_x = [];
      }
      if (initObj.hasOwnProperty('flow_y')) {
        this.flow_y = initObj.flow_y
      }
      else {
        this.flow_y = [];
      }
      if (initObj.hasOwnProperty('dt')) {
        this.dt = initObj.dt
      }
      else {
        this.dt = 0.0;
      }
      if (initObj.hasOwnProperty('scale_factor')) {
        this.scale_factor = initObj.scale_factor
      }
      else {
        this.scale_factor = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FlowFrame
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.uint32(obj.height, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.uint32(obj.width, buffer, bufferOffset);
    // Serialize message field [flow_x]
    bufferOffset = _arraySerializer.float32(obj.flow_x, buffer, bufferOffset, null);
    // Serialize message field [flow_y]
    bufferOffset = _arraySerializer.float32(obj.flow_y, buffer, bufferOffset, null);
    // Serialize message field [dt]
    bufferOffset = _serializer.float32(obj.dt, buffer, bufferOffset);
    // Serialize message field [scale_factor]
    bufferOffset = _serializer.float32(obj.scale_factor, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FlowFrame
    let len;
    let data = new FlowFrame(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [flow_x]
    data.flow_x = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [flow_y]
    data.flow_y = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [dt]
    data.dt = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [scale_factor]
    data.scale_factor = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.flow_x.length;
    length += 4 * object.flow_y.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'perception_stack_pkg/FlowFrame';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd8640e6324462ca9b9afc0877d3fce48';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint32 height
    uint32 width
    float32[] flow_x  
    float32[] flow_y  
    float32 dt        
    float32 scale_factor  
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FlowFrame(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.flow_x !== undefined) {
      resolved.flow_x = msg.flow_x;
    }
    else {
      resolved.flow_x = []
    }

    if (msg.flow_y !== undefined) {
      resolved.flow_y = msg.flow_y;
    }
    else {
      resolved.flow_y = []
    }

    if (msg.dt !== undefined) {
      resolved.dt = msg.dt;
    }
    else {
      resolved.dt = 0.0
    }

    if (msg.scale_factor !== undefined) {
      resolved.scale_factor = msg.scale_factor;
    }
    else {
      resolved.scale_factor = 0.0
    }

    return resolved;
    }
};

module.exports = FlowFrame;
