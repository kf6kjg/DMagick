module dmagick.c.locale;

import core.stdc.stdio;
import core.sys.posix.sys.types;
import core.vararg;

import dmagick.c.exception;
import dmagick.c.hashmap;
import dmagick.c.magickType;

extern(C)
{
	struct LocaleInfo
	{
		char*
			path,
			tag,
			message;

		MagickBooleanType
			stealth;

		LocaleInfo*
			previous,
			next;

		size_t
			signature;
	}

	char** GetLocaleList(const(char)*, size_t*, ExceptionInfo*);

	const(char)* GetLocaleMessage(const(char)*);

	const(LocaleInfo)*  GetLocaleInfo_(const(char)*, ExceptionInfo*);
	const(LocaleInfo)** GetLocaleInfoList(const(char)*, size_t*, ExceptionInfo*);

	double InterpretLocaleValue(const(char)*, char**);

	LinkedListInfo* DestroyLocaleOptions(LinkedListInfo*);
	LinkedListInfo* GetLocaleOptions(const(char)*, ExceptionInfo*);

	MagickBooleanType ListLocaleInfo(FILE*, ExceptionInfo*);
	MagickBooleanType LocaleComponentGenesis();

	ssize_t FormatLocaleFile(FILE*, const(char)*, ...);
	ssize_t FormatLocaleFileList(FILE*, const(char)*, va_list);
	ssize_t FormatLocaleString(char*, const size_t, const(char)*, ...);
	ssize_t FormatLocaleStringList(char*, const size_t, const(char)*, va_list);

	void LocaleComponentTerminus();
}
