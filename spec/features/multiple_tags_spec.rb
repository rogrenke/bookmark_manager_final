feature 'multiple tags' do
  scenario 'adds multiple tags to link' do
    visit('links/new')
    fill_in 'title', with: 'multi-tag-test'
    fill_in 'url', with: 'www.multi-tag.com'
    fill_in 'tag_name', with: '1tag;2ndtag;multitag'
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('1tag')
    expect(link.tags.map(&:tag_name)).to include('2ndtag')
    expect(link.tags.map(&:tag_name)).to include('multitag')
  end
end
