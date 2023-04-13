abstract type SequentialMatrixGame{S,A} end

# from https://github.com/JuliaPOMDP/POMDPs.jl/blob/master/src/pomdp.jl

"""
    discount(m::SequentialMatrixGame)

Return the discount factor for the problem.
"""
function discount end

"""
    transition(m::SequentialMatrixGame, state, action)

Return the transition distribution from the current state-action pair.

If it is difficult to define the probability density or mass function explicitly, consider using `POMDPModelTools.ImplicitDistribution` to define a generative model.
"""
function transition end

"""
    reward(m::SequentialMatrixGame, s, a)

Return the immediate reward for the s-a pair.

    reward(m::SequentialMatrixGame, s, a, sp)

Return the immediate reward for the s-a-s' triple
"""
function reward end

reward(m::SequentialMatrixGame, s, a, sp) = reward(m, s, a)

"""
    isterminal(m::SequentialMatrixGame, s)

Check if state `s` is terminal.

If a state is terminal, no actions will be taken in it and no additional rewards will be accumulated. Thus, the value function at such a state is, by definition, zero.
"""
isterminal(problem::SequentialMatrixGame, state) = false

"""
    initialstate(m::SequentialMatrixGame)

Return a distribution of initial states for game.
"""
function initialstate end

"""
    actionindex(problem::SequentialMatrixGame, a)

Return the integer index of action `a`. Used for discrete models only.
"""
function actionindex end

"""
    convert_s(::Type{V}, s, problem::SequentialMatrixGame) where V<:AbstractArray
    convert_s(::Type{S}, vec::V, problem::SequentialMatrixGame) where {S,V<:AbstractArray}

Convert a state to vectorized form or vice versa.
"""
function convert_s end

convert_s(T::Type{A1}, s::A2, problem::SequentialMatrixGame) where {A1<:AbstractArray, A2<:AbstractArray} = convert(T, s)

convert_s(::Type{A}, s::Number, problem::SequentialMatrixGame) where A<:AbstractArray = convert(A, [s])
convert_s(::Type{N}, v::AbstractArray{F}, problem::SequentialMatrixGame) where {N<:Number, F<:Number} = convert(N, first(v))


"""
    convert_a(::Type{V}, a, problem::Union{MDP,POMDP}) where V<:AbstractArray
    convert_a(::Type{A}, vec::V, problem::Union{MDP,POMDP}) where {A,V<:AbstractArray}

Convert an action to vectorized form or vice versa.
"""
function convert_a end

convert_a(T::Type{A1}, s::A2, problem::SequentialMatrixGame) where {A1<:AbstractArray, A2<:AbstractArray} = convert(T, s)

convert_a(::Type{A}, s::Number, problem::SequentialMatrixGame) where A<:AbstractArray = convert(A,[s])
convert_a(::Type{N}, v::AbstractArray{F}, problem::SequentialMatrixGame) where {N<:Number, F<:Number} = convert(N, first(v))
