# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target 'EmeraldComponents' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for EmeraldComponents
  pod 'JTAppleCalendar', '~> 7.0'
  pod 'InputMask'

  target 'EmeraldComponentsTests' do
    inherit! :search_paths
    # Pods for testing
  end
 
 target 'EmeraldComponentsApplicationUITests' do
     inherit! :search_paths
     # Pods for testing
 end
 
end

# Workaround for Cocoapods issue #7606
post_install do |installer|
    
    installer.pods_project.targets.each do |target|
        # add this line to remove warnings
        target.new_shell_script_build_phase.shell_script = "mkdir -p $PODS_CONFIGURATION_BUILD_DIR/#{target.name}"
        target.build_configurations.each do |config|
            config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
        end
    end
    
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
    
end
