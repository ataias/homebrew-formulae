class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1387+01b60634c"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1387+01b60634c.tar.xz"
      sha256 "8af1c24715f9402ff601b1f7b93e874bc44615700b830addc88b92b83aeb8a0d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1387+01b60634c.tar.xz"
      sha256 "769efcab993b956f91c1d8d989023f9b74c839ea219bdc08b642920f0d964d23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1387+01b60634c.tar.xz"
      sha256 "80249f2a2956b65648668342036c22927095f242c035fcddd6fd8243fd3df7b5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1387+01b60634c.tar.xz"
      sha256 "6e57c2e2efcf6c6b20260965517ec1227cb56e34506b06759b062654a6f51c52"
    end
  end

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install Dir["lib/*"]
  end

  test do
    system bin/"zig", "init"
    system bin/"zig", "build", "--summary", "all"
    system bin/"zig", "build", "run"
    system bin/"zig", "build", "test", "--summary", "all"
  end
end
