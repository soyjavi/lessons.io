import React from 'react';
// -- Components
import Particles from '../../components/particles'
import PricePlan from '../../components/price_plan'
// -- Context
import style from './style.scss';

const Join = props => {
  return (
    <section>
      <header className={style.header}>
        <div className={style.wrapper}>
          <h1 className={style.title}>Let's get you all signed up.</h1>
          <h5 className={style.description}>
            Joining Laracasts takes less than a minute, and, if your peers are correct, is a pretty dang good decision.
            If you're still on the fence, we have a plan called “monthly” - and it’s not like the gym. You may cancel it any time.
          </h5>
        </div>
        <Particles className={style.particles} />
      </header>
      <div>
        <PricePlan />
      </div>
    </section>
  );
};

export default Join;
