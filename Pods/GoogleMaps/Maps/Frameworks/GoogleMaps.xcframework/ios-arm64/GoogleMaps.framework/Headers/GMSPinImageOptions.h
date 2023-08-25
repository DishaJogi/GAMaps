//
//  GMSPinImageOptions.h
//  Google Maps SDK for iOS
//
//  Copyright 2023 Google LLC
//
//  Usage of this SDK is subject to the Google Maps/Google Earth APIs Terms of
//  Service: https://cloud.google.com/maps-platform/terms
//
/**
 *   This product or feature is in pre-GA. Pre-GA products and features might have limited support,
 *   and changes to pre-GA products and features might not be compatible with other pre-GA versions.
 *   Pre-GA Offerings are covered by the Google Maps Platform Service Specific Terms
 *   (https://cloud.google.com/maps-platform/terms/maps-service-terms).
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GMSPinImageGlyph;
NS_ASSUME_NONNULL_BEGIN

@interface GMSPinImageOptions : NSObject

/** An object representing a String or Image to replace the glyph on the marker */
@property(nonatomic, nullable) GMSPinImageGlyph *glyph;

/** The color used to fill the marker shape with. */
@property(nonatomic, nullable) UIColor *backgroundColor;

/** The color used for the border of the marker shape. */
@property(nonatomic, nullable) UIColor *borderColor;

@end
NS_ASSUME_NONNULL_END
