import React from "react";
import { Route, Switch } from "react-router-dom";

import Home from "../Home";
import Postes from "../Postes";
import Operators from "../Operators";
import OperatorShow from "../OperatorShow";
import NotFound from "../NotFound";

export default () => (
  <Switch>
    <Route exact path="/" component={Home} />
    <Route exact path="/operators" component={Operators} />
    <Route exact path="/operators/:id" component={OperatorShow} />
    <Route exact path="/postes" component={Postes} />
    <Route component={NotFound} />
  </Switch>
);
