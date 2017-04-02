type L is Literal

class box Literal is Parser
  let _text: String

  new val create(from: String) =>
    _text = from

  fun parse(source: String, offset: USize, tree: Bool, hidden: Parser)
    : ParseResult
  =>
    let offset' = skip_hidden(source, offset, hidden)

    if source.at(_text, offset'.isize()) then
      result(source, offset', _text.size(), tree)
    else
      (0, ParseFail)
    end
