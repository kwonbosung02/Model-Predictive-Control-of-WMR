function d = get_dMatrix(states, Acond,idx, params, num, data)

d = (states-data.states(num.simNum))' * Acond' * params.Qcond * Acond * (states-data.states(num.simNum));

end