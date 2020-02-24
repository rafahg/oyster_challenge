require 'oyster'

describe OysterCard do

# In order to use public transport
# As a customer
# I want money on my card
  it 'shows me my default balance' do
      expect(subject.balance).to eq OysterCard::DEFAULT_BALANCE
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    expect{ subject.top_up 1}.to change{ subject.balance }.by 1
  end

  it 'will fail if you try and top up past the maximum balance allowed, £90' do
    expect{subject.top_up(91)}.to raise_error 'You cant top up more than £90 balance'
  end
end
