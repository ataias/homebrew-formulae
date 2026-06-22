class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.947+36069a2a7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.947+36069a2a7.tar.xz"
      sha256 "28394dc7436b22686c883446f992fb51daa35f307fa59b0d1ec6195f47157c12"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.947+36069a2a7.tar.xz"
      sha256 "bbca87f79379e4b6431452870701524fd4020d92f91c62a46eeabd9eb592f720"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.947+36069a2a7.tar.xz"
      sha256 "61f89276620cf08b32e974245b34cb0e3a101a23877754a2fd542c9bf0efd793"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.947+36069a2a7.tar.xz"
      sha256 "5ee10a5d9d7e3ac6f9edbb25e51b00c0912a9faa4c55b2455b2a24ac8635e6cf"
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
