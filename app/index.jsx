import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import LayoutApp from './layouts/app';
import LayoutLanding from './layouts/landing';
import LayoutJoin from './layouts/join';
import LayoutUnknown from './layouts/unknown';
import common from './commons'

ReactDOM.render((
  <Router history={browserHistory}>
    <Route path='/' component={LayoutApp}>
      <IndexRoute component={LayoutLanding} />
      <Route path='/join' component={LayoutJoin}/>
      <Route path='series' component={LayoutUnknown}>
        <Route path='/serie/:id' component={LayoutUnknown} />
        <Route path='/serie/:id/:lesson' component={LayoutUnknown} />
      </Route>
      <Route path='*' component={LayoutUnknown}/>
    </Route>
  </Router>
), document.getElementById('app'));
