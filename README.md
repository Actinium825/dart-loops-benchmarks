# Dart Loops Benchmarks

A fork of https://github.com/XuanHanTan/dart-loops-benchmarks for benchmarking and comparing dart's 
loops of which is the fastest. In addition, tested here is benchmarking the use of json decode and
parsing an object.

## Contents
- [Steps to run](#steps-to-run)
- [Benchmark Setup](#benchmark-setup)
- [Results](#results)

## Steps to run
1. Update to latest Flutter version
2. Run `flutter pub get`
3. Run `benchmarks.dart` or `parse_benchmarks.dart`

## Benchmark Setup
1. To setup the benchmarks for json decoding and parsing, I created a `Character` model under 
`model/character.dart` with multiple properties of types `String`, `List<String>`, enums, 
`DateTime`, and `double`.
2. I added a json example for a `Character` under `model/simon_riley.dart` to be used with `jsonDecode`
and finally parse the json result
3. I duplicated the existing `benchmarks.dart` for parsing, replacing the `pow` with json decoding and
parsing
4. Finally, I updated the number of loops to `100`, `200`, and `500` and run the tests for 10 times

## Results
- For the original benchmark of testing with `300,000` loops, the fastest was `while reversed`,
followed by `for uncached` with the slowest being `map`
- For the parsing benchmark throughout testing with `100`, `200`, and `500` loops, the fastest was
`while cached` followed by `for uncached` with the slowest being `map`
- You may verify in the included `results.xlsx` or testing it on your own
