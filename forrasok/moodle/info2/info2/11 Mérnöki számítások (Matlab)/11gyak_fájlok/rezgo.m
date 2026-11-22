function [ y ] = rezgo( A,b,T, fi0,t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y=A*exp(-b*t).*sin(2*pi/T*t+fi0)

end

