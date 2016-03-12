import React from 'react';
// -- Components
import Title from '../../components/title'
import PricePlan from '../../components/price_plan'
// -- Context
import style from './style.scss';

const Join = props => {
  return (
    <article>
      <Title
        caption="Let's get you all signed up."
        description="Joining Laracasts takes less than a minute, and, if your peers are correct, is a pretty dang good decision.
            If you're still on the fence, we have a plan called monthly - and it’s not like the gym. You may cancel it any time."
      />
      <section>
        <PricePlan />
      </section>
    </article>
  );
};

export default Join;
