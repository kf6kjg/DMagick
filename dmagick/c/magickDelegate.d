module dmagick.c.magickDelegate;

import core.stdc.stdio;
import core.sys.posix.sys.types;

import dmagick.c.exception;
import dmagick.c.image;
import dmagick.c.magickType;

extern(C)
{
	struct DelegateInfo
	{
		char*
			path,
			decode,
			encode,
			commands;

		ssize_t
			mode;

		MagickBooleanType
			thread_support,
			spawn,
			stealth;

		DelegateInfo*
			previous,
			next;

		size_t
			signature;
	}

	char*  GetDelegateCommand(const(ImageInfo)*, Image*, const(char)*, const(char)*, ExceptionInfo*);
	char** GetDelegateList(const(char)*,size_t *,ExceptionInfo *);

	const(char)* GetDelegateCommands(const(DelegateInfo)*);

	const(DelegateInfo)*  GetDelegateInfo(const(char)*, const(char)*, ExceptionInfo* exception);
	const(DelegateInfo)** GetDelegateInfoList(const(char)*, size_t*, ExceptionInfo*);

	ssize_t GetDelegateMode(const(DelegateInfo)*);

	MagickBooleanType DelegateComponentGenesis();
	MagickBooleanType GetDelegateThreadSupport(const(DelegateInfo)*);
	MagickBooleanType InvokeDelegate(ImageInfo*, Image*, const(char)*, const(char)*, ExceptionInfo*);
	MagickBooleanType ListDelegateInfo(FILE*, ExceptionInfo*);

	void DelegateComponentTerminus();
}
