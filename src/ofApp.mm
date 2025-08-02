#include "ofApp.h"
#include "ofxTimeMeasurements.h"

using namespace ofxMarkSynth;

void ofApp::configSynth2(glm::vec2 size) {
  synth.configure(createFboConfigs2(size), createMods2(), size);
  synth.name = "Synth2";
}

//--------------------------------------------------------------
void ofApp::setup(){	
  ofSetBackgroundColor(0);
  ofDisableArbTex();
//  ofSetFrameRate(20);

  audioAnalysisClientPtr = std::make_shared<ofxAudioAnalysisClient::LocalGistClient>("", false, "");
  audioDataProcessorPtr = std::make_shared<ofxAudioData::Processor>(audioAnalysisClientPtr);
  audioDataProcessorPtr->setDefaultValiditySpecs();
  audioDataPlotsPtr = std::make_shared<ofxAudioData::Plots>(audioDataProcessorPtr);

  glm::vec2 size = ofGetWindowSize();
  configSynth2(size);
  
  // GL introspection
  GLint numExtensions = 0;
  glGetIntegerv(GL_NUM_EXTENSIONS, &numExtensions);
  for (GLint i = 0; i < numExtensions; ++i) {
      ofLogNotice() << (const char*)glGetStringi(GL_EXTENSIONS, i);
  }
}

//--------------------------------------------------------------
void ofApp::update(){
  audioDataProcessorPtr->update();
  synth.update();
}

//--------------------------------------------------------------
void ofApp::draw(){
  synth.draw();
  audioDataPlotsPtr->drawPlots();
  
  ofSetColor(255);
  ofDrawBitmapString(ofToString(ofGetFrameRate(), 2) + " FPS", 10, 20);
}

//--------------------------------------------------------------
void ofApp::exit(){
  audioAnalysisClientPtr->closeStream();
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}

//--------------------------------------------------------------
void ofApp::launchedWithURL(std::string url){

}
