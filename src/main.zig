const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 175;
const risk_penalty: i32 = 6;
const latency_penalty: i32 = 3;
const weight_bonus: i32 = 2;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 58, .capacity = 81, .latency = 16, .risk = 8, .weight = 11 };
    try std.testing.expectEqual(@as(i32, 123), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "review"));
    const signal_case_2 = Signal{ .demand = 88, .capacity = 82, .latency = 13, .risk = 25, .weight = 4 };
    try std.testing.expectEqual(@as(i32, 77), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "review"));
    const signal_case_3 = Signal{ .demand = 86, .capacity = 91, .latency = 20, .risk = 18, .weight = 5 };
    try std.testing.expectEqual(@as(i32, 105), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "review"));
}
