# Xojo-StringUtilsHarness-API2
#Homepage

This StringUtils module in the API Version 2 is maintained by [TECcompanion GmbH](https://teccompanion.com).
The current administrative contact for it is Jeannot Muller ([jeannot-muller.com](https://jeannot-muller.com)).
You should be able to find the latest version via this URL:

> [https://jeannot-muller.com/](https://jeannot-muller.com/) 
> 
> and on GitHub: 
> 
> [https://github.com/Jeannot-Muller/Xojo-StringUtilsHarness-API2](https://github.com/Jeannot-Muller/Xojo-StringUtilsHarness-API2)

# License

This StringUtils module is in the public domain.  You may use it for any purpose
whatsoever, but it comes with no express or implied warranty of correctness or
fitness for any purpose.

Share and enjoy!

# Contributors
Many people have contributed to the development of this module, including:

## API2
Jeannot Muller, [dr@jeannot-muller.com]() (*)

(*) To whom correspondence should be addressed.

## API1
Links are mostly outdated :-(

Frank Bitterlich, bitterlich@gsco.de
Ben Blake, benb@kagi.com
Cortis Clark, cortis@realsoftware.com
Carlos Martinho, rblists@rbtips.com
Jon Johnson, jonj@realsoftware.com
Joe Strout, joe@strout.net 
Florent Pillet, florent@florentpillet.com
Kem Tekinay, ktekinay@mactechnologies.com
Charles Yeomans, yeomans@desuetude.com

(*) To whom correspondence should be addressed.

# Version History

**2004-JUL-17: version 1.0**

* First public release.

**2004-JUL-22: version 1.1**

- Fixed some (harmless) warnings in CountRegEx and Repeat.
- Added ControlCharacters.
- Added DecimalSeparator.
- Added ThousandsSeparator.
- Added SplitByLength and SplitByLengthB.
- Added Sprintf.
- Added Trim, LTrim, and RTrim (with charsToTrim parameter).
- Improved the speed of CountFieldsQuoted substantially.
- Improved the speed of NthFieldQuoted and Squeeze slightly.

**2004-SEP-23: version 1.2**

- Fixed a bug in the TestSplitToVal unit test.
- Fixed a bug in EditDistance causing incorrect results in some cases.
- Improved the speed of EditDistance substantially.
- Changed EditDistance to be case-sensitive.

**2005-AUG-05: version 1.3**

- Improved speed of InStrReverseB.
- Fixed a bug in Sprintf that caused incorrect results when non-ASCII
  characters were used in the format string.

**2006-MAR-13: version 1.4**

- Improved speed of HexB slightly.
- Added MatchCase function.
- Fixed a bug in NthFieldQuoted which would cause it to fail when 
   the separator occurred as the first character of the string.
- Added Random function.
- Made all functions available to console apps except Sprintf.

**2006-APR-10: version 1.5**

- Improved speed of HexB substantially.
- Adjusted Random so that it should work in 5.5 and earlier (untested).
- Added SplitQuoted and JoinQuoted functions.
- Added EncodeCase and DecodeCase functions.

**2006-JUN-29: version 1.6**

- Fixed buggy handling of "%%" in Sprintf, and made it so that unspecified
   values are output as if you had specified 0; also changed %c to output
   a Unicode character for the given code point.
- Improved speed of Reverse and ReverseB (thanks to Charles Yeomans).
   Note that I'm not sure whether the new code works in 5.5; somebody who
   has 5.5 is going to have to start helping with that (if anyone cares).
- Added new LineEnding function, that returns the first line ending (of
   any standard sort) that is found in the string.

**2006-AUG-08: version 1.7**

- Added InStrQuoted function.
- Rewrote SplitQuoted in terms of InStrQuoted.  This fixed several bugs
   in the previous implementation, including an infinite loop and an
   OutOfBoundsException that could occur on certain inputs.
- Rewrote NthFieldQuoted in terms of InStrQuoted, just to make the code
   simpler and more consistent.  This should cause no changes in behavior.

**2006-SEP-06: version 1.8**

- Fixed a bug in EndsWithB that would cause it to fail on multi-byte characters.
- Added versions of Chop and ChopB that specify a string to chop off, rather
   than a number of characters.
- Dramatically improved the speed of Squeeze.  NOTE: Also changed the
   behavior slightly.  Squeeze now uses standard, non-binary text matching.
- A new function, SqueezeB, is now provided for binary squeezing.  Both
   versions are substantially faster than the old one, which always did binary,
   but existing code may want to switch to SqueezeB.

**2007-MAR-15: version 1.9**

- Made Chop and ChopB work in RB2006R4 as they did in previous versions,
  returning an empty string when told to chop more than the total number
  of chars or bytes.  (Previous code relied on an undefined behavior of Left
  and LeftB.)
- Added the WrapLines function.
- Improved speed of the Repeat function, especially on large repeat counts.
- Added the GuessEncoding functions.
- Added the SwapBytePairs and SwapByteQuads functions.

**2012-AUG-10: version 2.0**

- Fixed a bug in Sprintf that caused incorrect results in some cases when the
  replacement values contained non-ASCII characters.
  
**2020-DEC-26: version 2.1**

* Conversion to Xojo API2

**2020-DEC-27: version 2.2**

- Added API1 and API2 versions as a binaryfile to the repository.

## Archive
In the folder 'Binaries' you will find the original API version, as .rb file and converted to a Xojo Binary Project. Please don't change the original files for those users, who want to see the original version and try the conversion themselves for education purposes.