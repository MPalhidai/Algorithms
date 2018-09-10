import Acronyms from './acronym';

describe('Acronyms are produced from', () => {
  const acronyms = new Acronyms;
  test('title cased phrases', () => {
    expect(acronyms.parse('Portable Network Graphics')).toEqual('PNG');
  });

  test('other title cased phrases', () => {
    expect(acronyms.parse('Ruby on Rails')).toEqual('ROR');
  });

  test('inconsistently cased phrases', () => {
    expect(acronyms.parse('HyperText Markup Language')).toEqual('HTML');
  });

  test('phrases with punctuation', () => {
    expect(acronyms.parse('First In, First Out')).toEqual('FIFO');
  });

  test('other phrases with punctuation', () => {
    expect(acronyms.parse('PHP: Hypertext Preprocessor')).toEqual('PHP');
  });

  test('phrases with punctuation and sentence casing', () => {
    expect(acronyms.parse('Complementary metal-oxide semiconductor')).toEqual('CMOS');
  });
});
