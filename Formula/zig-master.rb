class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3091+557caecaa"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3091+557caecaa.tar.xz"
      sha256 "e3a0f916e5d358c16e3b4dec9f98f6db3e53cdd1daca658c3c46088b403fd3c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3091+557caecaa.tar.xz"
      sha256 "5bf79e700a860b65ae3ec8710168d17c03d71af5238707ae23d53a23ca80bba8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3091+557caecaa.tar.xz"
      sha256 "1f756ff76a9fe75ffa9dc7209b015960801047ecdce1123a523e35c4fccddd39"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3091+557caecaa.tar.xz"
      sha256 "7f24ba2f5619bc8dfb2814de1d6e36d857944130ba3c47860489d749140bd968"
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
