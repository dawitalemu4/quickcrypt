const green = prettyzig.RGB.init(139, 233, 255); // #8ef6ff
const red = prettyzig.RGB.init(255, 85, 85); // #ff5555

pub fn display(output: []const u8, status: Status) !void {
    const stdout = std.io.getStdOut().writer();

    switch (status) {
        .success => {
            try prettyzig.print(stdout, status, .{ .color = .{ .rgb = green }, .styles = &.{.bold} });
            try prettyzig.print(stdout, output, .{});
        },
        .failure => {
            try prettyzig.print(stdout, status, .{ .color = .{ .rgb = red }, .styles = &.{.bold} });
            try prettyzig.print(stdout, output, .{ .color = .{ .rgb = red } });
        },
    }
}

const std = @import("std");
const prettyzig = @import("prettyzig");

const Status = @import("utils.zig").Status;
