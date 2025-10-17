
"use strict";

let DetectionList = require('./DetectionList.js');
let BoundingBox = require('./BoundingBox.js');
let FlowFrame = require('./FlowFrame.js');
let TrackedObject = require('./TrackedObject.js');
let TrackedObjectsList = require('./TrackedObjectsList.js');
let ProcessedTrackedObject = require('./ProcessedTrackedObject.js');
let ProcessedTrackedObjectsList = require('./ProcessedTrackedObjectsList.js');

module.exports = {
  DetectionList: DetectionList,
  BoundingBox: BoundingBox,
  FlowFrame: FlowFrame,
  TrackedObject: TrackedObject,
  TrackedObjectsList: TrackedObjectsList,
  ProcessedTrackedObject: ProcessedTrackedObject,
  ProcessedTrackedObjectsList: ProcessedTrackedObjectsList,
};
