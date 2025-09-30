pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    var app = yazap.App.init(allocator, "quickcrypt", "Simple CLI tool to quickly sanity check d/encrypted values");
    defer app.deinit();

    var quickcrypt = app.rootCommand();
    try quickcrypt.addSubcommand(app.createCommand("view", "View decrypted value from input"));
    try quickcrypt.addSubcommand(app.createCommand("create", "Create ecrypted value from input (or random)"));

    const input = try app.parseProcess();
    if (input.subcommandMatches("help")) |_| {
        try app.displayHelp();
    } else if (input.containsArg("help")) {
        try app.displayHelp();
    } else if (input.containsArg("h")) {
        try app.displayHelp();
    }

    // if (input.subcommandMatches("view")) |view_args| {
    //     // switch view_args.parse_result.args.key {
    //     // }
    // } else if (input.subcommandMatches("create")) |create_args| {
    // }
}

const std = @import("std");
const yazap = @import("yazap");

const display = @import("display.zig");
const utils = @import("utils.zig");
