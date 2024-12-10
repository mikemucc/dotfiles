#!/bin/bash
defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariBackOffInterval -int 157784760
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2090-01-01T00:00:00Z
defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 10.99
defaults write com.apple.Safari DefaultBrowserDateOfLastPrompt -date '2090-01-01T00:00:00Z'
defaults write com.apple.Safari DefaultBrowserPromptingState -int 2

for i in {2..9}
do
    defaults write com.apple.Safari DefaultBrowserDateOfLastPrompt$i -date '2090-01-01T00:00:00Z'
    defaults write com.apple.Safari DefaultBrowserPromptingState$i -int 2
done

echo "Safari should now back off..."
