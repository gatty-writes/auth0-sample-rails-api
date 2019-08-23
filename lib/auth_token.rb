
class AuthToken
    def self.perform
        AuthAuthorization.new('DH').request_access_token
    end
end
