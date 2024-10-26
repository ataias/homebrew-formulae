class SwiftHelloWorld < Formula
  desc "A hello world program written in Swift"
  homepage "https://github.com/ataias/swift-hello-world"
  url "https://github.com/ataias/swift-hello-world/archive/refs/tags/0.1.1.tar.gz"
  sha256 "3bad845ebe42a95d221e49d993cb186e1076811c01f2c71fdc55ff57fe4a2c5d"
  license ""

  on_macos do
    depends_on xcode: ["16.0", :build]
  end

  on_linux do
    depends_on "swift" => ["6.0", :build]
  end

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/swift-hello-world"
  end

  service do
    run [opt_bin/"swift-hello-world"]
    run_type :interval
    interval 5
    log_path var/"log/swift-hello-world.log"
    error_log_path var/"log/swift-hello-world.error.log"
  end
end
