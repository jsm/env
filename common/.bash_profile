source ~/.bashrc
export PATH=/opti/optimizely2/out:$PATH
export PATH=/opti/optimizely2/out/ec2_api_tools/bin:$PATH
export EC2_HOME=/opti/optimizely2/out/ec2_api_tools
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export PATH=/opti/optimizely/out:$PATH
export PATH=/opti/optimizely/out/ec2_api_tools/bin:$PATH
export EC2_HOME=/opti/optimizely/out/ec2_api_tools
export PATH=/opti/optimizely3/out:$PATH
export PATH=/opti/optimizely3/out/ec2_api_tools/bin:$PATH
export EC2_HOME=/opti/optimizely3/out/ec2_api_tools
PATH=$(find /opti/optimizely/bin -type d | sed "/\/\\./d" | tr "\n" ":" | sed "s/:$//"):$PATH
