package cases;

import haxe.display.Display;
import haxe.display.FsPath;
import haxe.display.Server;
import utest.Assert;

using StringTools;
using Lambda;

class RetyperTests extends TestCase {
	function testNonSignature() {
		vfs.putContent("WithDependency.hx", getTemplate("WithDependency.hx"));
		vfs.putContent("Dependency.hx", getTemplate("Dependency.hx"));
		var args = [
			"-main",
			"WithDependency.hx",
			"--no-output",
			"-js",
			"no.js",
			"--macro",
			"haxe.macro.CompilationServer.setModuleCheckPolicy(['WithDependency'], [Retype], false)"
		];
		runHaxe(args);
		runHaxeJson([], ServerMethods.Invalidate, {file: new FsPath("Dependency.hx")});
		runHaxe(args);
		Assert.isTrue(hasMessage('Retyped module WithDependency'));
	}

	function testSignature() {
		vfs.putContent("WithSignatureDependency.hx", getTemplate("WithSignatureDependency.hx"));
		vfs.putContent("Dependency.hx", getTemplate("Dependency.hx"));
		var args = [
			"-main",
			"WithSignatureDependency.hx",
			"--no-output",
			"-js",
			"no.js",
			"--macro",
			"haxe.macro.CompilationServer.setModuleCheckPolicy(['WithSignatureDependency'], [Retype], false)"
		];
		runHaxe(args);
		runHaxeJson([], ServerMethods.Invalidate, {file: new FsPath("Dependency.hx")});
		runHaxe(args);
		Assert.isTrue(hasMessage('Retyping module WithSignatureDependency'));
		Assert.isTrue(hasMessage('Failed retyping module WithSignatureDependency'));
	}

	function testSignatureInferredArg() {
		vfs.putContent("WithSignatureDependency.hx", getTemplate("WithSignatureDependencyInferredArg.hx"));
		vfs.putContent("Dependency.hx", getTemplate("Dependency.hx"));
		var args = [
			"-main",
			"WithSignatureDependency.hx",
			"--no-output",
			"-js",
			"no.js",
			"--macro",
			"haxe.macro.CompilationServer.setModuleCheckPolicy(['WithSignatureDependency'], [Retype], false)"
		];
		runHaxe(args);
		runHaxeJson([], ServerMethods.Invalidate, {file: new FsPath("Dependency.hx")});
		runHaxe(args);
		Assert.isTrue(hasMessage('Retyping module WithSignatureDependency'));
		Assert.isTrue(hasMessage('Failed retyping module WithSignatureDependency'));
	}

	function testSignatureInferredRet() {
		vfs.putContent("WithSignatureDependency.hx", getTemplate("WithSignatureDependencyInferredRet.hx"));
		vfs.putContent("Dependency.hx", getTemplate("Dependency.hx"));
		var args = [
			"-main",
			"WithSignatureDependency.hx",
			"--no-output",
			"-js",
			"no.js",
			"--macro",
			"haxe.macro.CompilationServer.setModuleCheckPolicy(['WithSignatureDependency'], [Retype], false)"
		];
		runHaxe(args);
		runHaxeJson([], ServerMethods.Invalidate, {file: new FsPath("Dependency.hx")});
		runHaxe(args);
		Assert.isTrue(hasMessage('Retyping module WithSignatureDependency'));
		Assert.isTrue(hasMessage('Failed retyping module WithSignatureDependency'));
	}

	function testSignatureVariable() {
		vfs.putContent("WithSignatureDependency.hx", getTemplate("WithSignatureDependencyVariable.hx"));
		vfs.putContent("Dependency.hx", getTemplate("Dependency.hx"));
		var args = [
			"-main",
			"WithSignatureDependency.hx",
			"--no-output",
			"-js",
			"no.js",
			"--macro",
			"haxe.macro.CompilationServer.setModuleCheckPolicy(['WithSignatureDependency'], [Retype], false)"
		];
		runHaxe(args);
		runHaxeJson([], ServerMethods.Invalidate, {file: new FsPath("Dependency.hx")});
		runHaxe(args);
		Assert.isTrue(hasMessage('Retyping module WithSignatureDependency'));
		Assert.isTrue(hasMessage('Failed retyping module WithSignatureDependency'));
	}

	function testSignatureInferredVariable() {
		vfs.putContent("WithSignatureDependency.hx", getTemplate("WithSignatureDependencyInferredVariable.hx"));
		vfs.putContent("Dependency.hx", getTemplate("Dependency.hx"));
		var args = [
			"-main",
			"WithSignatureDependency.hx",
			"--no-output",
			"-js",
			"no.js",
			"--macro",
			"haxe.macro.CompilationServer.setModuleCheckPolicy(['WithSignatureDependency'], [Retype], false)"
		];
		runHaxe(args);
		runHaxeJson([], ServerMethods.Invalidate, {file: new FsPath("Dependency.hx")});
		runHaxe(args);
		Assert.isTrue(hasMessage('Retyping module WithSignatureDependency'));
		Assert.isTrue(hasMessage('Failed retyping module WithSignatureDependency'));
	}

	function testSignatureProperty() {
		vfs.putContent("WithSignatureDependency.hx", getTemplate("WithSignatureDependencyProperty.hx"));
		vfs.putContent("Dependency.hx", getTemplate("Dependency.hx"));
		var args = [
			"-main",
			"WithSignatureDependency.hx",
			"--no-output",
			"-js",
			"no.js",
			"--macro",
			"haxe.macro.CompilationServer.setModuleCheckPolicy(['WithSignatureDependency'], [Retype], false)"
		];
		runHaxe(args);
		runHaxeJson([], ServerMethods.Invalidate, {file: new FsPath("Dependency.hx")});
		runHaxe(args);
		Assert.isTrue(hasMessage('Retyping module WithSignatureDependency'));
		Assert.isTrue(hasMessage('Failed retyping module WithSignatureDependency'));
	}

	function testSignatureInferredProperty() {
		vfs.putContent("WithSignatureDependency.hx", getTemplate("WithSignatureDependencyInferredProperty.hx"));
		vfs.putContent("Dependency.hx", getTemplate("Dependency.hx"));
		var args = [
			"-main",
			"WithSignatureDependency.hx",
			"--no-output",
			"-js",
			"no.js",
			"--macro",
			"haxe.macro.CompilationServer.setModuleCheckPolicy(['WithSignatureDependency'], [Retype], false)"
		];
		runHaxe(args);
		runHaxeJson([], ServerMethods.Invalidate, {file: new FsPath("Dependency.hx")});
		runHaxe(args);
		Assert.isTrue(hasMessage('Retyping module WithSignatureDependency'));
		Assert.isTrue(hasMessage('Failed retyping module WithSignatureDependency'));
	}

	function testMutual() {
		vfs.putContent("WithMutualDependency.hx", getTemplate("WithMutualDependency.hx"));
		vfs.putContent("MutualDependency.hx", getTemplate("MutualDependency.hx"));
		var args = [
			"-main",
			"WithMutualDependency.hx",
			"--no-output",
			"-js",
			"no.js",
			"--macro",
			"haxe.macro.CompilationServer.setModuleCheckPolicy(['WithMutualDependency'], [Retype], false)"
		];
		runHaxe(args);
		runHaxeJson([], ServerMethods.Invalidate, {file: new FsPath("MutualDependency.hx")});
		runHaxe(args);
		Assert.isTrue(hasMessage('Retyping module WithMutualDependency'));
		Assert.isTrue(hasMessage('Retyped module WithMutualDependency'));
	}
}
