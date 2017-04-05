module ApplicationHelper
  # 条件が true の場合のみ、divタグを表示する
  def div_tag_if(condition, content_or_options_with_block = nil, options = nil, escape = true, &block)
    # condition が trueの場合だけ、content_tagメソッドでdivタグを作成する
    # falseの場合は、何も作成しない
    if condition
      content_tag("div", content_or_options_with_block, options, escape, &block)
    end
  end
end
