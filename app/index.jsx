import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import LayoutApp from './layouts/app';
import LayoutLanding from './layouts/landing';
import LayoutJoin from './layouts/join';
import LayoutSignIn from './layouts/sign_in';
import LayoutUnknown from './layouts/unknown';
import LayoutSeries from './layouts/series';
import LayoutSerie from './layouts/serie';
import commons from './commons'

ReactDOM.render((
  <Router history={browserHistory}>
    <Route path='/' component={LayoutApp}>
      <IndexRoute component={LayoutLanding} />
      <Route path='join' component={LayoutJoin}/>
      <Route path='sign_in' component={LayoutSignIn}/>
      <Route path='series' component={LayoutSeries} />
      <Route path='series/:serie' component={LayoutSerie} />
      <Route path='series/:serie/episodes/:episode' component={LayoutUnknown} />
      <Route path='*' component={LayoutUnknown}/>
    </Route>
  </Router>
), document.getElementById('app'));

// if (particlesJS) {
//   particlesJS("particles-js", {"particles":{"number":{"value":80,"density":{"enable":true,"value_area":800}},"color":{"value":"#ffffff"},"shape":{"type":"circle","stroke":{"width":0,"color":"#000000"},"polygon":{"nb_sides":5},"image":{"src":"img/github.svg","width":100,"height":100}},"opacity":{"value":0.5,"random":false,"anim":{"enable":false,"speed":1,"opacity_min":0.1,"sync":false}},"size":{"value":3,"random":true,"anim":{"enable":false,"speed":40,"size_min":0.1,"sync":false}},"line_linked":{"enable":true,"distance":150,"color":"#ffffff","opacity":0.4,"width":1},"move":{"enable":true,"speed":6,"direction":"none","random":false,"straight":false,"out_mode":"out","bounce":false,"attract":{"enable":false,"rotateX":600,"rotateY":1200}}},"interactivity":{"detect_on":"canvas","events":{"onhover":{"enable":true,"mode":"repulse"},"onclick":{"enable":true,"mode":"push"},"resize":true},"modes":{"grab":{"distance":400,"line_linked":{"opacity":1}},"bubble":{"distance":400,"size":40,"duration":2,"opacity":8,"speed":3},"repulse":{"distance":200,"duration":0.4},"push":{"particles_nb":4},"remove":{"particles_nb":2}}},"retina_detect":true});
// }
