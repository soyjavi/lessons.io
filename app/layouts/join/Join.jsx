import React from 'react';
// -- Components
import PricePlans from './join.PricePlans'
// -- Context
import style from './style.scss';

const Join = props => {
  return (
    <section>
      <header className={style.header}>
        <div className={style.wrapper}>
          <h1 className={style.title}>Let's get you all signed up.</h1>
          <p>
            Joining Laracasts takes less than a minute, and, if your peers are correct, is a pretty dang good decision.
            If you're still on the fence, we have a plan called “monthly” - and it’s not like the gym. You may cancel it any time.
          </p>
        </div>
      </header>
      <div>
        <PricePlans />
      </div>
    </section>
  );
};

export default Join;
