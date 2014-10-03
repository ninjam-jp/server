

require! {
  chai.assert
}

_ = require \lodash


##
# merge object properties
#
# marge-config(config, default-config, file-config, commandline-config)
#
merge-config = _.assign



describe 'Test Config' (void) !->

  it 'merge config properties' (done) !->

    config = {}

    default-config =
      default-bpm: 120
      default-bpi: 16

    user-config =
      default-bpm: 40


    merge-config(config, default-config, user-config)


    assert.deep-equal config, do
      default-bpm: 40
      default-bpi: 16

    # test only 'a' has side-effect
    assert _.is-equal default-config, do
      default-bpm: 120
      default-bpi: 16

    assert _.is-equal user-config, do
      default-bpm: 40

    done!
