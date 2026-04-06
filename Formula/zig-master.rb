class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3121+d34b868bc"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3121+d34b868bc.tar.xz"
      sha256 "ebfb3cde14ef4d04a83cc870d83bcc51940bef73d0ff3e7eb379037ef6480d88"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3121+d34b868bc.tar.xz"
      sha256 "9cf32a54091cb89ab3fdda88e2394febc54cdd4e91102cfdc3fc558eb0d98c8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3121+d34b868bc.tar.xz"
      sha256 "8f24a2a4be380e0c99eb6523ac294f05a20e626d098053810af68e10c4708a62"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3121+d34b868bc.tar.xz"
      sha256 "6f62a84f59a5c0b5e5581ddf1dc24cf922c14ff8ad9f0c30d331f4df5d3f3ec4"
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
