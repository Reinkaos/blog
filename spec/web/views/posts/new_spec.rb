require_relative '../../../../apps/web/views/posts/new'

class NewPostParams < Hanami::Action::Params
  params do
    required(:post).schema do
      required(:title).filled(:str?)
      required(:body).filled(:str?)
    end
  end
end

RSpec.describe Web::Views::Posts::New do
  let(:params) { NewPostParams.new(post: {}) }
  let(:exposures) { Hash[params: params] }
  let(:template) { Hanami::View::Template.new('apps/web/templates/posts/new.html.erb') }
  let(:view) { Web::Views::Posts::New.new(template, exposures) }
  let(:rendered) { view.render }

  it 'displays list of errors when params contains errors' do
    params.valid?

    expect(rendered).to include 'There was a problem with your submission'
    expect(rendered).to include 'Title is missing'
    expect(rendered).to include 'Body is missing'
  end
end
