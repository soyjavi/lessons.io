import SuperAgent from 'superagent'
import Hope from 'hope'
// -- Context

const Request = {
  get: (endpoint, parameters) => {
    return _request('get', endpoint, parameters);
  },

  post: (endpoint, parameters) => {
    return _request('post', endpoint, parameters);
  },

  put: (endpoint, parameters) => {
    return _request('put', endpoint, parameters);
  },

  del: (endpoint, parameters) => {
    return _request('del', endpoint, parameters);
  }
};

export default Request;

const _request = (type, endpoint, parameters) => {
  const promise = new Hope.Promise()
  SuperAgent[type](`/api/${endpoint}`)
    [type === 'get' ? 'query' : 'send'](parameters)
    .end((error, response) => {
      promise.done(error, response);
    }
  );
  return promise;
}
