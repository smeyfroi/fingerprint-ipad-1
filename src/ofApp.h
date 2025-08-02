#pragma once

#include "ofxiOS.h"
#include "ofxMarkSynth.h"

class ofApp : public ofxiOSApp {
  
public:
  void setup() override;
  void update() override;
  void draw() override;
  void exit() override;
  
  void touchDown(ofTouchEventArgs & touch) override;
  void touchMoved(ofTouchEventArgs & touch) override;
  void touchUp(ofTouchEventArgs & touch) override;
  void touchDoubleTap(ofTouchEventArgs & touch) override;
  void touchCancelled(ofTouchEventArgs & touch) override;
  
  void lostFocus() override;
  void gotFocus() override;
  void gotMemoryWarning() override;
  void deviceOrientationChanged(int newOrientation) override;
  void launchedWithURL(std::string url) override;
  
private:
  std::shared_ptr<ofxAudioAnalysisClient::LocalGistClient> audioAnalysisClientPtr;
  std::shared_ptr<ofxAudioData::Processor> audioDataProcessorPtr;
  std::shared_ptr<ofxAudioData::Plots> audioDataPlotsPtr;
  
  void configSynth1(glm::vec2 size);
  void configSynth2(glm::vec2 size);
  ofxMarkSynth::ModPtrs createMods1();
  ofxMarkSynth::FboConfigPtrs createFboConfigs1(glm::vec2 size);
  ofxMarkSynth::ModPtrs createMods2();
  ofxMarkSynth::FboConfigPtrs createFboConfigs2(glm::vec2 size);
  
  ofxMarkSynth::Synth synth;
  ofxMarkSynth::FboPtr fluidFboPtr = std::make_shared<PingPongFbo>();
  ofxMarkSynth::FboPtr fluidVelocitiesFboPtr = std::make_shared<PingPongFbo>();
  ofxMarkSynth::FboPtr rawPointsFboPtr = std::make_shared<PingPongFbo>();
  ofxMarkSynth::FboPtr fboPtrMinorLinesPtr = std::make_shared<PingPongFbo>();
  ofxMarkSynth::FboPtr fboPtrMajorLinesPtr = std::make_shared<PingPongFbo>();
  ofxMarkSynth::FboPtr fboCollagePtr = std::make_shared<PingPongFbo>();
  ofxMarkSynth::FboPtr fboSandlinesPtr = std::make_shared<PingPongFbo>();
  ofxMarkSynth::FboPtr fboClusterParticlesPtr = std::make_shared<PingPongFbo>();
  ofxMarkSynth::FboPtr fboMotionParticlesPtr = std::make_shared<PingPongFbo>();
};
