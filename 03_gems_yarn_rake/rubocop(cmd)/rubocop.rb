#========== AGIR SUR RUBOCOP =============


# DESACTTIVER SOULIGNEMENT SUR LES METHODS TROP LONGUES

def foo # rubocop:disable Metrics/MethodLength
    bar
end

# rubocop:disable Layout/LineLength, Style/StringLiterals
You can also disable entire departments by giving a department name in the comment.
# rubocop:disable Metrics, Layout/LineLength
You can also disable all cops with
# rubocop:disable all
