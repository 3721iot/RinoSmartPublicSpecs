Pod::Spec.new do |s|

  s.author                  = { 'RinoSmartInc' => 'RinoSmart' }
  s.cocoapods_version       = '>= 1.10'
  s.description             = <<-DESC
  TODO: Add long description of the pod here.
                                 DESC
  s.homepage                = 'https://github.com/3721iot'
  s.license                 = 'none'
  s.name                    = 'RinoDeviceKit'
  s.ios.deployment_target   = '12.4'
  s.source                  = { :http => 'https://rinoiot-iot-test-1313015441.cos.ap-guangzhou.myqcloud.com/app/20230925/VOJLMWobf1pK0x_ios_1695627883299.zip', :type => 'zip' }
  s.summary                 = 'A short description of RinoDeviceKit.'
  s.vendored_frameworks     = 'Build/RinoDeviceKit.xcframework'
  s.version                 = '1.0.1'
  
  s.frameworks = 'Foundation', 'Matter', 'MatterSupport'
  
#  s.libraries = 'libswiftWebKit.tbd'
  
  s.dependency 'MJExtension', '~> 3.4.1'
  s.dependency 'RinoAppConfigModule'
  s.dependency 'RinoBizCore'
  s.dependency 'RinoBaseKit'
  s.dependency 'RinoCommonDefineKit'
  s.dependency 'RinoFoundationKit'
  s.dependency 'RinoLanguageKit'
  s.dependency 'RinoMQTTKit'
  s.dependency 'RinoNetworkRequestKit'
  s.dependency 'RinoUIKit'

  s.define_singleton_method :support_xcode12_config do
    pod_xcconfig = attributes_hash.fetch('pod_target_xcconfig', {})

    all_archs = %w[arm64 armv7 x86_64 i386]
    exclude_archs = all_archs - pod_xcconfig.fetch('VALID_ARCHS', all_archs.join(' ')).split(' ')

    pod_xcconfig['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
    pod_xcconfig['EXCLUDED_ARCHS[sdk=watchsimulator*]'] = 'x86_64 arm64'
    unless exclude_archs.empty?
      pod_xcconfig['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] += ' ' + exclude_archs.join(' ')
    end

    pod_xcconfig.delete('VALID_ARCHS')
    attributes_hash['pod_target_xcconfig'] = pod_xcconfig

    user_xcconfig = attributes_hash.fetch('user_target_xcconfig', {})
    user_xcconfig['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
    user_xcconfig['EXCLUDED_ARCHS[sdk=watchsimulator*]'] = 'x86_64 arm64'
    attributes_hash['user_target_xcconfig'] = user_xcconfig
  end

s.support_xcode12_config

end
