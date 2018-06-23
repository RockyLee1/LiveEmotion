
Pod::Spec.new do |s|

  s.name         = "BBLiveEmotionSDK"
  s.version      = "1.0.7"
  s.summary      = "BBLiveEmotionSDK."

  s.description  = <<-DESC
			BBLiveEmotionSDK is build for project
                   DESC

  s.homepage     = "http://106.14.8.80:90/linzuhan/BBLiveEmotionSDK"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "linzuhan" => "linzuhanbobei@163.com" }

  s.platform     = :ios, "8.0"
  s.source       = { git: "http://106.14.8.80:90/linzuhan/BBLiveEmotionSDK.git", tag: "v#{s.version}" }

  s.prepare_command = "\n\n mv BBLiveEmotion.framework/BBLiveEmotionResource.bundle . \n"


  s.vendored_frameworks = "BBLiveEmotion.framework"
  s.resources = "BBLiveEmotionResource.bundle"

  s.requires_arc = true

end
