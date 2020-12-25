#tag Module
Protected Module UnitTests
	#tag CompatibilityFlags = TargetHasGUI
	#tag Method, Flags = &h1, CompatibilityFlags = TargetHasGUI
		Protected Sub DetailedErrorIf(errCondition As Boolean, details As String)
		  // Unit testing code calls this function to check if an error has
		  // occurred.  If so, report it to the user and then break into
		  // the debugger so he can do something about it.
		  
		  if not errCondition then return
		  
		  MessageBox( "Unit test failure." + EndOfLine + EndOfLine + details )
		  
		  
		  break  // OK, now look at the stack to see what went wrong!
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = TargetHasGUI
		Protected Sub ErrorIf(errCondition As Boolean)
		  // Unit testing code calls this function to check if an error has
		  // occurred.  If so, report it to the user and then break into
		  // the debugger so he can do something about it.
		  
		  if not errCondition then return
		  
		  Var msg As String
		  MessageBox( "Unit test failure." )
		  #if DebugBuild
		    msg = msg + EndOfLine + EndOfLine _
		    + "Click OK to drop into the debugger and examine the stack."
		  #endif
		  MessageBox( msg )
		  
		  
		  break  // OK, now look at the stack to see what went wrong!
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = TargetHasGUI
		Protected Sub Run()
		  // Run all our unit tests.
		  
		  TestChop
		  TestContains
		  TestContainsB
		  TestCount
		  TestCountFieldsQuoted
		  TestCountRegEx
		  TestDecodeCase
		  TestEditDistance
		  TestEncodeCase
		  TestGuessEncoding
		  TestHexB
		  TestInStrQuoted
		  TestInStrReverse
		  TestInStrReverseB
		  TestJoinQuoted
		  TestLineEnding
		  TestMatchCase
		  TestMetaphone
		  TestNthFieldQuoted
		  TestPadBoth
		  TestPadLeft
		  TestPadRight
		  TestRandom
		  TestRemove
		  TestRepeat
		  TestReplaceRange
		  TestReverse
		  TestReverseB
		  TestSoundex
		  TestSplitByLength
		  TestSplitByRegEx
		  TestSplitQuoted
		  TestSplitToCDbl
		  TestSplitToInt
		  TestSplitToVal
		  TestSprintf
		  TestSqueeze
		  TestStartsWith
		  TestStartsWithB
		  TestSwapBytePairs
		  TestSwapByteQuads
		  TestTrim
		  TestWrapLines
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestChop()
		  // Test Chop and ChopB.
		  
		  ErrorIf StringUtils.Chop("abcde", 2) <> "abc"
		  ErrorIf StringUtils.Chop("abc", 10) <> ""
		  ErrorIf StringUtils.Chop("abc", 0) <> "abc"
		  ErrorIf StringUtils.Chop("日本語", 1) <> "日本"
		  
		  ErrorIf StringUtils.Chop("foo.txt", ".txt") <> "foo"
		  ErrorIf StringUtils.Chop("foo.txt", ".jpg") <> "foo.txt"
		  ErrorIf StringUtils.Chop("FOO.TXT", ".txt") <> "FOO"
		  ErrorIf StringUtils.Chop("foo.txt", ".TXT") <> "foo"
		  
		  ErrorIf StringUtils.ChopB("abcde", 2) <> "abc"
		  ErrorIf StringUtils.ChopB("abc", 10) <> ""
		  ErrorIf StringUtils.ChopB("abc", 0) <> "abc"
		  ErrorIf StringUtils.ChopB(ConvertEncoding("日本語", Encodings.UTF16), 2) <> "日本"
		  
		  ErrorIf StringUtils.ChopB("foo.txt", ".txt") <> "foo"
		  ErrorIf StringUtils.ChopB("foo.txt", ".jpg") <> "foo.txt"
		  ErrorIf StringUtils.ChopB("FOO.TXT", ".txt") <> "FOO.TXT"
		  ErrorIf StringUtils.ChopB("foo.txt", ".TXT") <> "foo.txt"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestContains()
		  Var s As String
		  
		  s = "This is a test, just a test."
		  ErrorIf not s.Contains("this")
		  ErrorIf not s.Contains("u")
		  ErrorIf not s.Contains("")
		  ErrorIf s.Contains("that")
		  ErrorIf s.Contains("isa")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestContainsB()
		  Var s As String
		  
		  s = "This is a test, just a test."
		  ErrorIf not s.ContainsB("This")
		  ErrorIf not s.ContainsB("test")
		  ErrorIf not s.ContainsB("u")
		  ErrorIf not s.ContainsB("")
		  ErrorIf s.ContainsB("this")
		  ErrorIf s.ContainsB("TEST")
		  ErrorIf s.ContainsB("that")
		  ErrorIf s.ContainsB("isa")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestCount()
		  ErrorIf StringUtils.Count("foo bar baz", "B") <> 2
		  ErrorIf StringUtils.CountB("foo bar baz", "B") <> 0
		  ErrorIf StringUtils.CountB("foo bar baz", "b") <> 2
		  ErrorIf StringUtils.CountB("foo bar baz", "oo") <> 1
		  ErrorIf StringUtils.CountB("foooo bar baz", "oo") <> 2
		  ErrorIf StringUtils.Count("foo", "") <> 4
		  ErrorIf StringUtils.CountB("foo", "") <> 4
		  ErrorIf StringUtils.Count("", "") <> 1
		  ErrorIf StringUtils.CountB("", "") <> 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestCountFieldsQuoted()
		  Var s as string
		  Var result, expectedResult as integer
		  
		  s = """Hello, Kitty"", ""One"", ""Two, Three"""
		  result = StringUtils.CountFieldsQuoted(s, ",")
		  expectedResult = 3
		  ErrorIf result <> expectedResult
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestCountRegEx()
		  ErrorIf StringUtils.CountRegEx("fee fie fo fum", "f.e") <> 2
		  ErrorIf StringUtils.CountRegEx("fee fie fo fum", "f(.*)e") <> 1
		  ErrorIf StringUtils.CountRegEx("fee fie fo fum", "f[aeiou]") <> 4
		  ErrorIf StringUtils.CountRegEx("fee fie fo fum", "f[xqt]") <> 0
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestDecodeCase()
		  Var testPairs() As String = Array( _
		  "foo", "foo", _
		  "FOO", "^foo", _
		  "Foo", "^f^oo", _
		  "May You Live in Interesting Times.", "^m^ay ^y^ou ^l^ive in ^i^nteresting ^t^imes.", _
		  "23 Foo 45", "23 ^f^oo 45", _
		  "2^3", "2^^3", _
		  "üø ÉÎ", "üø ^éî", _
		  "ÜØ éî", "^üø ^éî" _
		  )
		  
		  Var i As Integer
		  for i = 0 to UBound( testPairs ) step 2
		    Var result As String = StringUtils.DecodeCase( testPairs(i+1) )
		    DetailedErrorIf result <> testPairs(i), _
		    "EncodeCase returned """ + result + """, expected """ + testPairs(i) + """."
		  next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestEditDistance()
		  ErrorIf StringUtils.EditDistance( "test", "test" ) <> 0
		  ErrorIf StringUtils.EditDistance( "test", "TEST" ) <> 4
		  ErrorIf StringUtils.EditDistance( "Gumbo", "Gambol" ) <> 2
		  ErrorIf StringUtils.EditDistance( "Gambol", "Gumbo" ) <> 2
		  ErrorIf StringUtils.EditDistance( "Fiddle", "Fidle" ) <> 1
		  ErrorIf StringUtils.EditDistance( "Fiddle", "Fodle" ) <> 2
		  ErrorIf StringUtils.EditDistance( "Fidle", "Fiddle" ) <> 1
		  ErrorIf StringUtils.EditDistance( "Fodle", "Fiddle" ) <> 2
		  ErrorIf StringUtils.EditDistance( "Bread", "Dead" ) <> 2
		  ErrorIf StringUtils.EditDistance( "This is a test", "That was a test" ) <> 4
		  ErrorIf StringUtils.EditDistance( "ay", "fooey" ) <> 4
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestEncodeCase()
		  Var testPairs() As String = Array( _
		  "foo", "foo", _
		  "FOO", "^foo", _
		  "Foo", "^f^oo", _
		  "May You Live in Interesting Times.", "^m^ay ^y^ou ^l^ive in ^i^nteresting ^t^imes.", _
		  "23 Foo 45", "23 ^f^oo 45", _
		  "2^3", "2^^3", _
		  "üø ÉÎ", "üø ^éî", _
		  "ÜØ éî", "^üø ^éî" _
		  )
		  
		  Var i As Integer
		  for i = 0 to UBound( testPairs ) step 2
		    Var result As String = StringUtils.EncodeCase( testPairs(i) )
		    DetailedErrorIf result <> testPairs(i+1), _
		    "EncodeCase returned """ + result + """, expected """ + testPairs(i+1) + """."
		  next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestGuessEncoding()
		  Var s As String
		  
		  s = "All your base are belong to us."
		  UnitTests.ErrorIf StringUtils.GuessEncoding(s) <> Encodings.ASCII
		  
		  s = "Deine ganze Unterseite gehören uns. Jemand stellte uns herauf die Bombe ein." _
		  + " Du hast keine Wahrscheinlichkeit zu überleben, bildest deine Zeit."
		  
		  Var se As String = ConvertEncoding( s, Encodings.UTF8 )
		  UnitTests.ErrorIf not StringUtils.GuessEncoding(se).Equals( Encodings.UTF8 )
		  
		  Var wrongByteOrder As Boolean
		  se = ConvertEncoding( s, Encodings.UTF16 )
		  UnitTests.ErrorIf not StringUtils.GuessEncoding(se, wrongByteOrder).Equals( Encodings.UTF16 )
		  UnitTests.ErrorIf wrongByteOrder
		  
		  se = StringUtils.SwapBytePairs( se )
		  UnitTests.ErrorIf not StringUtils.GuessEncoding(se, wrongByteOrder).Equals( Encodings.UTF16 )
		  UnitTests.ErrorIf not wrongByteOrder
		  
		  se = ConvertEncoding( s, Encodings.SystemDefault )
		  UnitTests.ErrorIf not StringUtils.GuessEncoding(se).Equals( Encodings.SystemDefault )
		  
		  // not yet supported:
		  'se = ConvertEncoding( s, Encodings.ISOLatin1 )
		  'UnitTests.ErrorIf not StringUtils.GuessEncoding(se).Equals( Encodings.ISOLatin1 )
		  
		  s = Encodings.UTF8.Chr( &hFEFF ) + s
		  se = ConvertEncoding( s, Encodings.UTF8 )
		  UnitTests.ErrorIf not StringUtils.GuessEncoding(se).Equals( Encodings.UTF8 )
		  
		  se = ConvertEncoding( s, Encodings.UTF16 )
		  UnitTests.ErrorIf not StringUtils.GuessEncoding(se).Equals( Encodings.UTF16 )
		  
		  se = StringUtils.SwapBytePairs( se )
		  UnitTests.ErrorIf not StringUtils.GuessEncoding(se, wrongByteOrder).Equals( Encodings.UTF16 )
		  UnitTests.ErrorIf not wrongByteOrder
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestHexB()
		  ErrorIf StringUtils.HexB("a") <> "61"
		  ErrorIf StringUtils.HexB("A") <> "41"
		  ErrorIf StringUtils.HexB("ABC") <> "41 42 43"
		  ErrorIf StringUtils.HexB(chrB(5) + ChrB(12)) <> "05 0C"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestInStrQuoted()
		  ErrorIf StringUtils.InStrQuoted( "abcde", "c" ) <> 3
		  ErrorIf StringUtils.InStrQuoted( "a""bc""de", "c" ) <> 0
		  ErrorIf StringUtils.InStrQuoted( "a""bc""dedcba", "c" ) <> 9
		  ErrorIf StringUtils.InStrQuoted( 6, "abcdedcba", "c" ) <> 7
		  ErrorIf StringUtils.InStrQuoted( 6, "a""bc""dedcba", "c" ) <> 9
		  ErrorIf StringUtils.InStrQuoted( "a""bc""d""ed""cba", "c" ) <> 11
		  ErrorIf StringUtils.InStrQuoted( "a""bcdedcb""a", "c" ) <> 0
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestInStrReverse()
		  ErrorIf StringUtils.InStrReverse( 5, "abcde", "e" ) <> 5
		  ErrorIf StringUtils.InStrReverse( 5, "abcde", "de" ) <> 4
		  ErrorIf StringUtils.InStrReverse( 6, "abcabc", "bc" ) <> 5
		  ErrorIf StringUtils.InStrReverse( 4, "abcabc", "bc" ) <> 2
		  ErrorIf StringUtils.InStrReverse( 6, "abcabc", "de" ) <> 0
		  ErrorIf StringUtils.InStrReverse( 6, "abcabc", "CA" ) <> 3
		  
		  ErrorIf StringUtils.InStrReverse( "abcde", "e" ) <> 5
		  ErrorIf StringUtils.InStrReverse( "abcde", "de" ) <> 4
		  ErrorIf StringUtils.InStrReverse( "abcabc", "bc" ) <> 5
		  ErrorIf StringUtils.InStrReverse( "abcabc", "de" ) <> 0
		  ErrorIf StringUtils.InStrReverse( "abcabc", "CA" ) <> 3
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestInStrReverseB()
		  ErrorIf StringUtils.InStrReverseB( 5, "abcde", "e" ) <> 5
		  ErrorIf StringUtils.InStrReverseB( 5, "abcde", "de" ) <> 4
		  ErrorIf StringUtils.InStrReverseB( 6, "abcabc", "bc" ) <> 5
		  ErrorIf StringUtils.InStrReverseB( 4, "abcabc", "bc" ) <> 2
		  ErrorIf StringUtils.InStrReverseB( 6, "abcabc", "de" ) <> 0
		  ErrorIf StringUtils.InStrReverseB( 6, "abcabc", "CA" ) <> 0
		  
		  ErrorIf StringUtils.InStrReverseB( "abcde", "e" ) <> 5
		  ErrorIf StringUtils.InStrReverseB( "abcde", "de" ) <> 4
		  ErrorIf StringUtils.InStrReverseB( "abcabc", "bc" ) <> 5
		  ErrorIf StringUtils.InStrReverseB( "abcabc", "de" ) <> 0
		  ErrorIf StringUtils.InStrReverseB( "abcabc", "CA" ) <> 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestJoinQuoted()
		  // Test JoinQuotes
		  Var test(-1), result as String
		  
		  test = Array("test1", "test2", "test3a, test3b", "test4")
		  result = StringUtils.JoinQuoted(test, ",")
		  ErrorIf result <> "test1,test2,""test3a, test3b"",test4"
		  
		  test = Array("test1", "test2","test3a", "test3b", "test4")
		  result = StringUtils.JoinQuoted(test, ",")
		  ErrorIf result <> "test1,test2,test3a,test3b,test4"
		  
		  test = Array("test1", "test2", "test3a, test3b, test3c test again")
		  result = StringUtils.JoinQuoted(test, ",")
		  ErrorIf result <> "test1,test2,""test3a, test3b, test3c test again"""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestLineEnding()
		  
		  for each eol As String in Array( EndOfLine.Unix, EndOfLine.Windows, EndOfLine.Macintosh )
		    UnitTests.ErrorIf StringUtils.LineEnding( "Foo" + eol + "Bar" ) <> eol
		  next
		  UnitTests.ErrorIf StringUtils.LineEnding( "No end in sight!" ) <> EndOfLine
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestMatchCase()
		  ErrorIf StrComp( StringUtils.MatchCase( "FOO bar", "a room with a view" ), _
		  "foo bar", 0 ) <> 0
		  
		  ErrorIf StrComp( StringUtils.MatchCase( "FOO bar", "A ROOM WITH A VIEW" ), _
		  "FOO BAR", 0 ) <> 0
		  
		  ErrorIf StrComp( StringUtils.MatchCase( "FOO bar", "A Room With A View" ), _
		  "Foo Bar", 0 ) <> 0
		  
		  ErrorIf StrComp( StringUtils.MatchCase( "FOO bar", " 123 A B C Street" ), _
		  "Foo Bar", 0 ) <> 0
		  
		  ErrorIf StrComp( StringUtils.MatchCase( "FOO bar", " 123 A ST" ), _
		  "FOO BAR", 0 ) <> 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestMetaphone()
		  Var primary, alternate As string
		  
		  StringUtils.Metaphone("", primary, alternate)
		  ErrorIf primary <> "" or alternate <> ""
		  
		  StringUtils.Metaphone("   ", primary, alternate)
		  ErrorIf primary <> "" or alternate <> ""
		  
		  StringUtils.Metaphone("Xavier", primary, alternate)
		  ErrorIf primary <> "SF" or alternate <> "SFR"
		  
		  StringUtils.Metaphone("Dumb", primary, alternate)
		  ErrorIf primary <> "TM" or alternate <> "TM"
		  
		  StringUtils.Metaphone("Bambi", primary, alternate)
		  ErrorIf primary <> "PMP" or alternate <> "PMP"
		  
		  StringUtils.Metaphone("Church", primary, alternate)
		  ErrorIf primary <> "XRX" or alternate <> "XRK"
		  
		  StringUtils.Metaphone("Mac Gregor", primary, alternate)
		  ErrorIf primary <> "MKRKR" or alternate <> "MKRKR"
		  
		  StringUtils.Metaphone("Caesar", primary, alternate)
		  ErrorIf primary <> "SSR" or alternate <> "SSR"
		  
		  StringUtils.Metaphone("Succeed", primary, alternate)
		  ErrorIf primary <> "SKST" or alternate <> "SKST"
		  
		  StringUtils.Metaphone("Checker", primary, alternate)
		  ErrorIf primary <> "XKR" or alternate <> "XKR"
		  
		  StringUtils.Metaphone("School", primary, alternate)
		  ErrorIf primary <> "SKL" or alternate <> "SKL"
		  
		  StringUtils.Metaphone("Shrink", primary, alternate)
		  ErrorIf primary <> "XRNK" or alternate <> "XRNK"
		  
		  StringUtils.Metaphone("Bumpkin", primary, alternate)
		  ErrorIf primary <> "PMPKN" or alternate <> "PMPKN"
		  
		  StringUtils.Metaphone("Adams", primary, alternate)
		  ErrorIf primary <> "ATMS" or alternate <> "ATMS"
		  
		  StringUtils.Metaphone("Albright", primary, alternate)
		  ErrorIf primary <> "ALPRT" or alternate <> "ALPRT"
		  
		  StringUtils.Metaphone("Howey", primary, alternate)
		  ErrorIf primary <> "H" or alternate <> "H"
		  
		  StringUtils.Metaphone("Jose", primary, alternate)
		  ErrorIf primary <> "JS" or alternate <> "HS"
		  
		  StringUtils.Metaphone("Cappuccino", primary, alternate)
		  ErrorIf primary <> "KPXN" or alternate <> "KPXN"
		  
		  StringUtils.Metaphone("Axel", primary, alternate)
		  ErrorIf primary <> "AKSL" or alternate <> "AKSL"
		  
		  StringUtils.Metaphone("Paris", primary, alternate)
		  ErrorIf primary <> "PRS" or alternate <> "PRS"
		  
		  StringUtils.Metaphone("Computer", primary, alternate)
		  ErrorIf primary <> "KMPTR" or alternate <> "KMPTR"
		  
		  StringUtils.Metaphone("Stephen", primary, alternate)
		  ErrorIf primary <> "STFN" or alternate <> "STFN"
		  
		  StringUtils.Metaphone("Steven", primary, alternate)
		  ErrorIf primary <> "STFN" or alternate <> "STFN"
		  
		  StringUtils.Metaphone("Thomas", primary, alternate)
		  ErrorIf primary <> "TMS" or alternate <> "TMS"
		  
		  StringUtils.Metaphone("Karmilowicz", primary, alternate)
		  ErrorIf primary <> "KRMLTS" or alternate <> "KRMLFX"
		  
		  StringUtils.Metaphone("Breaux", primary, alternate)
		  ErrorIf primary <> "PR" or alternate <> "PR"
		  
		  StringUtils.Metaphone("Zhao", primary, alternate)
		  ErrorIf primary <> "J" or alternate <> "J"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestNthFieldQuoted()
		  Var s as string
		  Var result, expectedResult as string
		  
		  s = """Hello, Kitty"", ""One"", ""Two, Three"""
		  result = StringUtils.NthFieldQuoted(s, ",", 3)
		  expectedResult = " ""Two, Three""" // Note the leading space!
		  ErrorIf StrComp(result, expectedResult, 0)<>0
		  
		  s = ",""Hello, Kitty"", ""One"", ""Two, Three"""
		  result = StringUtils.NthFieldQuoted(s, ",", 1)
		  expectedResult = ""
		  ErrorIf StrComp(result, expectedResult, 0)<>0
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestPadBoth()
		  ErrorIf StringUtils.PadBoth("foo",2) <> "foo"
		  ErrorIf StringUtils.PadBoth("abcdef",2) <> "abcdef"
		  ErrorIf StringUtils.PadBoth("foo",5) <> " foo "
		  ErrorIf StringUtils.PadBoth("foo",6) <> "  foo "
		  ErrorIf StringUtils.PadBoth("foo",6,".,") <> ".,foo."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestPadLeft()
		  ErrorIf StringUtils.PadLeft("foo",2) <> "foo"
		  ErrorIf StringUtils.PadLeft("foo",3) <> "foo"
		  ErrorIf StringUtils.PadLeft("foo",6) <> "   foo"
		  ErrorIf StringUtils.PadLeft("foo",6,".") <> "...foo"
		  ErrorIf StringUtils.PadLeft("foo",5,",..") <> ",.foo"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestPadRight()
		  ErrorIf StringUtils.PadRight("foo",2) <> "foo"
		  ErrorIf StringUtils.PadRight("foo",3) <> "foo"
		  ErrorIf StringUtils.PadRight("foo",6) <> "foo   "
		  ErrorIf StringUtils.PadRight("foo",6,".") <> "foo..."
		  ErrorIf StringUtils.PadRight("foo",5,",..") <> "foo,."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestRandom()
		  Var result As String = StringUtils.Random( 8, "abcde" )
		  UnitTests.ErrorIf result.Len <> 8
		  UnitTests.ErrorIf result.Encoding <> Encoding( "abcde" )
		  for i As Integer = 1 to result.Len
		    Var c As String = Mid( result, i, 1 )
		    UnitTests.ErrorIf c < "a" or c > "e"
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestRemove()
		  ErrorIf StringUtils.Remove("this   is a  test") <> "thisisatest"
		  ErrorIf StringUtils.Remove("wooow maaan", "aeiou") <> "ww mn"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestRepeat()
		  ErrorIf StringUtils.Repeat("spam ", 5) <> "spam spam spam spam spam "
		  ErrorIf StringUtils.Repeat("*", 5) <> "*****"
		  ErrorIf StringUtils.Repeat("Yo", 2) <> "YoYo"
		  ErrorIf Encoding(StringUtils.Repeat("Yo", 2)) <> Encodings.UTF8
		  ErrorIf StringUtils.Repeat("", 256) <> ""
		  ErrorIf StringUtils.Repeat("Foo", 0) <> ""
		  ErrorIf StringUtils.Repeat("Foo", -12) <> ""
		  ErrorIf StringUtils.Repeat("Abcd", 4) <> "AbcdAbcdAbcdAbcd"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestReplaceRange()
		  ErrorIf StringUtils.ReplaceRange( "abcde", 2, 3, "-" ) <> "a-e"
		  ErrorIf StringUtils.ReplaceRange( "abcde", 1, 2, "***" ) <> "***cde"
		  ErrorIf StringUtils.ReplaceRange( "abcde", 1, 10, "***" ) <> "***"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestReverse()
		  ErrorIf StringUtils.Reverse("abc") <> "cba"
		  ErrorIf StringUtils.Reverse("abcd") <> "dcba"
		  ErrorIf StringUtils.Reverse("") <> ""
		  ErrorIf StringUtils.Reverse("a") <> "a"
		  ErrorIf StringUtils.Reverse("日本語") <> "語本日"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestReverseB()
		  ErrorIf StringUtils.ReverseB("abc") <> "cba"
		  ErrorIf StringUtils.ReverseB("abcd") <> "dcba"
		  ErrorIf StringUtils.ReverseB("") <> ""
		  ErrorIf StringUtils.ReverseB("a") <> "a"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestSoundex()
		  ErrorIf StringUtils.Soundex("Lee") <> "L000"
		  ErrorIf StringUtils.Soundex("Baily") <> "B400"
		  ErrorIf StringUtils.Soundex("Van Baily") <> "B400"
		  ErrorIf StringUtils.Soundex("Van Baily", false) <> "V514"
		  ErrorIf StringUtils.Soundex("Strout") <> "S363"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestSplitByLength()
		  Var flds(-1) As String
		  
		  flds = StringUtils.SplitByLength( "0123456789ABCDEF", 5 )
		  ErrorIf UBound(flds) <> 3
		  ErrorIf flds(0) <> "01234" or _
		  flds(1) <> "56789" or _
		  flds(2) <> "ABCDE" or _
		  flds(3) <> "F"
		  
		  flds = StringUtils.SplitByLength( "0123456789ABCDEF", 8 )
		  ErrorIf UBound(flds) <> 1
		  ErrorIf flds(0) <> "01234567" or _
		  flds(1) <> "89ABCDEF"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestSplitByRegEx()
		  Var got(-1), expected(-1) As String
		  Var i As Integer
		  
		  got = StringUtils.SplitByRegEx("fee fie ho hum", "[fgh]")
		  expected = Array("", "ee ", "ie ", "o ", "um")
		  for i = 0 to UBound(expected)
		    ErrorIf expected(i) <> got(i)
		  next
		  
		  got = StringUtils.SplitByRegEx("fee fie ho hum", "fie")
		  expected = Array("fee ", " ho hum")
		  for i = 0 to UBound(expected)
		    ErrorIf expected(i) <> got(i)
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestSplitQuoted()
		  // Test SplitQuotes
		  Var temp(-1) as String
		  
		  temp = StringUtils.SplitQuoted("Test1,test2,""test3"",""test4""" , ",", true)
		  ErrorIf temp(1) <> "test2"
		  ErrorIf temp(2) <> "test3"
		  ErrorIf temp(3) <> "test4"
		  
		  temp = StringUtils.SplitQuoted("""Test1,test2"",""test3"",""test4""" , ",", true)
		  ErrorIf temp(0) <> "Test1,test2"
		  ErrorIf temp(1) <> "test3"
		  ErrorIf temp(2) <> "test4"
		  
		  temp = StringUtils.SplitQuoted("test1,test2,""test3a, test3b"",test4,test5,test6", ",", false)
		  ErrorIf temp(1) <> "test2"
		  ErrorIf temp(2) <> """test3a, test3b"""
		  ErrorIf temp(4) <> "test5"
		  
		  temp = StringUtils.SplitQuoted("test1,test2,""test3a, test3b"",test4,test5,test6", ",", true)
		  ErrorIf temp(1) <> "test2"
		  ErrorIf temp(2) <> "test3a, test3b"
		  ErrorIf temp(4) <> "test5"
		  
		  temp = StringUtils.SplitQuoted("""test1a,test1b"",test2,test3,test4,test5,test6", ",", true)
		  ErrorIf temp(0) <> "test1a,test1b"
		  ErrorIf temp(2) <> "test3"
		  ErrorIf temp(4) <> "test5"
		  
		  temp = StringUtils.SplitQuoted("""Test with no commas""", ",", false)
		  ErrorIf temp(0) <> """Test with no commas"""
		  
		  temp = StringUtils.SplitQuoted("""Test with no commas""", ",", true)
		  ErrorIf temp(0) <> "Test with no commas"
		  
		  temp = StringUtils.SplitQuoted("""Test with , commas""", ",", false)
		  ErrorIf temp(0) <> """Test with , commas"""
		  
		  temp = StringUtils.SplitQuoted("""Test with , commas""", ",", true)
		  ErrorIf temp(0) <> "Test with , commas"
		  
		  temp = StringUtils.SplitQuoted( ",""A,B,C""", ",", true )
		  ErrorIf temp(0) <> ""
		  ErrorIf temp(1) <> "A,B,C"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestSplitToCDbl()
		  Var expect(-1) As Double
		  Var got(-1) As Double
		  Var i As Integer
		  
		  expect = Array(42,12345,-5,0,10.8)
		  got = StringUtils.SplitToCDbl("42 12" + StringUtils.ThousandsSeparator + "345 -5 +0 10" _
		  + StringUtils.DecimalSeparator + "8")
		  for i = 0 to UBound(expect)
		    if got(i) <> expect(i) then
		      ErrorIf true
		      return
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestSplitToInt()
		  Var expect(-1) As Integer
		  Var got(-1) As Integer
		  Var i As Integer
		  
		  expect = Array(42,12345,-5,0,10)
		  got = StringUtils.SplitToInt("42, 12345, -5,+0, 10" + StringUtils.DecimalSeparator + "8", ",")
		  for i = 0 to UBound(expect)
		    if got(i) <> expect(i) then
		      ErrorIf true
		      return
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestSplitToVal()
		  Var expect(-1) As Double
		  Var got(-1) As Double
		  Var i As Integer
		  
		  expect = Array(42,12345,-5,0,10.8)
		  got = StringUtils.SplitToVal("42, 12345, -5,+0, 10.8", ",")
		  for i = 0 to UBound(expect)
		    if got(i) <> expect(i) then
		      ErrorIf true
		      return
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestSprintf()
		  Var mask, result, expectedResult as string
		  
		  
		  mask = "abc %08b %c %06.2d %9.9e %06.2u %09.3f %'z8o %'_-12s %04x %04X xyz"
		  result = StringUtils.Sprintf(mask, _
		  44, _ // b
		  65, _ // c
		  -122.87, _ // d
		  -987.654, _ // e
		  122.87, _ // u
		  -987.6539, _ // f
		  77, _ // o
		  "ijk", _ // s
		  127, _ // x
		  127) // X
		  
		  expectedResult = "abc 00101100 A -00123 " _
		  + "-9" + StringUtils.DecimalSeparator + "876540000e+02 " _
		  + "000123 " _
		  + "-00000987" + StringUtils.DecimalSeparator + "654 " _
		  + "zzzzz115 ijk_________ 007f 007F xyz"
		  
		  ErrorIf StrComp(expectedResult, result, 0) <> 0
		  
		  result = StringUtils.Sprintf("de %d à %d maximum",10,20)
		  expectedResult = "de 10 à 20 maximum"
		  ErrorIf StrComp(expectedResult, result, 0) <> 0
		  
		  result = StringUtils.Sprintf("Foo %% bar")
		  expectedResult = "Foo % bar"
		  ErrorIf StrComp(expectedResult, result, 0) <> 0
		  
		  result = StringUtils.Sprintf("%d%% %% %d%% is %d%%.", 8, 5, 3)
		  expectedResult = "8% % 5% is 3%."
		  ErrorIf StrComp(expectedResult, result, 0) <> 0
		  
		  result = StringUtils.Sprintf("%18s%30s%12s%12s", "JAUREGUI", "Lé", "20/3/1992", "10/5/2010")
		  expectedResult = "          JAUREGUI                            Lé   20/3/1992   10/5/2010"
		  ErrorIf StrComp(expectedResult, result, 0) <> 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestSqueeze()
		  // Test Squeeze and SqueezeB.
		  
		  ErrorIf StringUtils.Squeeze("this   is a  test") <> "this is a test"
		  ErrorIf StringUtils.Squeeze("wooow maaan", "aeiou") <> "wow man"
		  ErrorIf StringUtils.Squeeze("WOOoow maaan", "aeiou") <> "Wow man"
		  
		  ErrorIf StringUtils.SqueezeB("this   is a  test") <> "this is a test"
		  ErrorIf StringUtils.SqueezeB("wooow maaan", "aeiou") <> "wow man"
		  ErrorIf StringUtils.SqueezeB("WOOoow maaan", "aeiou") <> "WOOow man"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestStartsWith()
		  Var s As String = "Foo bar baz"
		  
		  ErrorIf s.StartsWith("bar")
		  ErrorIf not s.StartsWith("foo")
		  ErrorIf not s.StartsWith("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestStartsWithB()
		  Var s As String = "Foo bar baz"
		  
		  ErrorIf s.StartsWithB("bar")
		  ErrorIf s.StartsWithB("foo")
		  ErrorIf not s.StartsWithB("Foo")
		  ErrorIf not s.StartsWithB("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestSwapBytePairs()
		  Var s As String = "ABCDEFGH"
		  Var s2 As String = StringUtils.SwapBytePairs(s)
		  UnitTests.ErrorIf s2 <> "BADCFEHG"
		  UnitTests.ErrorIf s.Encoding <> s2.Encoding
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestSwapByteQuads()
		  Var s As String = "ABCDEFGH"
		  Var s2 As String = StringUtils.SwapByteQuads(s)
		  UnitTests.ErrorIf s2 <> "DCBAHGFE"
		  UnitTests.ErrorIf s.Encoding <> s2.Encoding
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = TargetHasGUI
		Private Sub TestTrim()
		  ErrorIf StringUtils.Trim(" foo bar " + EndOfLine, StringUtils.ControlCharacters + " ") <> "foo bar"
		  ErrorIf StringUtils.Trim("@*#!Gosh darn!@*#", "!@#$*") <> "Gosh darn"
		  ErrorIf StringUtils.Trim("@*#!Gosh darn", "!@#$*") <> "Gosh darn"
		  ErrorIf StringUtils.Trim("Gosh darn!@*#", "!@#$*") <> "Gosh darn"
		  ErrorIf StringUtils.Trim("Gosh darn", "!@#$*") <> "Gosh darn"
		  
		  ErrorIf StringUtils.RTrim(" foo bar " + EndOfLine, StringUtils.ControlCharacters + " ") <> " foo bar"
		  ErrorIf StringUtils.RTrim("@*#!Gosh darn!@*#", "!@#$*") <> "@*#!Gosh darn"
		  ErrorIf StringUtils.RTrim("@*#!Gosh darn", "!@#$*") <> "@*#!Gosh darn"
		  ErrorIf StringUtils.RTrim("Gosh darn!@*#", "!@#$*") <> "Gosh darn"
		  ErrorIf StringUtils.RTrim("Gosh darn", "!@#$*") <> "Gosh darn"
		  
		  ErrorIf StringUtils.LTrim(" foo bar " + EndOfLine, StringUtils.ControlCharacters + " ") <> "foo bar " + EndOfLine
		  ErrorIf StringUtils.LTrim("@*#!Gosh darn!@*#", "!@#$*") <> "Gosh darn!@*#"
		  ErrorIf StringUtils.LTrim("@*#!Gosh darn", "!@#$*") <> "Gosh darn"
		  ErrorIf StringUtils.LTrim("Gosh darn!@*#", "!@#$*") <> "Gosh darn!@*#"
		  ErrorIf StringUtils.LTrim("Gosh darn", "!@#$*") <> "Gosh darn"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestWrapLines()
		  Var lines() As String = Array( "Your free trial is fully", _
		  "functional. Uncheck this box only if you think what we're doing is", _
		  "   +-------+", _
		  "   |so cool|", _
		  "   +-------+", _
		  "that you want to show us a little extra love and adoration." )
		  
		  Var correct() As String = Array( "Your free trial is fully functional.", _
		  "Uncheck this box only if you think what", _
		  "we're doing is", _
		  "   +-------+", _
		  "   |so cool|", _
		  "   +-------+", _
		  "that you want to show us a little extra", _
		  "love and adoration." )
		  
		  StringUtils.WrapLines( lines, 40, true )
		  ErrorIf UBound( lines ) <> Ubound( correct )
		  for i As Integer = 0 to UBound( lines )
		    ErrorIf lines(i) <> correct(i)
		  next
		  
		  
		  lines = Array("Here's another test", _
		  "involving a too-long word that starts", _
		  "with a dash: -foooooooooooooooooooooo")
		  correct = Array( "Here's another test", _
		  "involving a too-long", _
		  "word that starts", _
		  "with a dash: ", _
		  "-fooooooooooooooooooo", _
		  "ooo" )
		  
		  StringUtils.WrapLines( lines, 21, true )
		  ErrorIf UBound( lines ) <> Ubound( correct )
		  for i As Integer = 0 to UBound( lines )
		    ErrorIf lines(i) <> correct(i)
		  next
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
