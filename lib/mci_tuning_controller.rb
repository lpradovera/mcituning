# encoding: utf-8

class MciTuningController < Adhearsion::CallController

  def run
    answer
    play "tt-weasels"
    Member.cache do
      ActiveRecord::Base.connection_pool.with_connection do
        member = Member.find_by_email('test1@mojolingo.com')
        trans = member.transactions.find_by_reason('debit')
        logger.info "#{member.name} #{trans}"
        ActiveRecord::Base.connection_pool.release_connection
      end
    end
  end
end
